module Sepa
  module DanskeSoapRequest
    def find_correct_build
      case @command
      when :create_certificate
        build_certificate_request
      when :upload_file, :download_file, :get_user_info, :download_file_list
        build_danske_generic_request
      when :get_bank_certificate
        build_get_bank_certificate_request
      end
    end

    def encrypt_application_request
      encryption_cert = OpenSSL::X509::Certificate.new(@enc_cert)

      encryption_public_key = encryption_cert.public_key

      encryption_cert = format_cert(encryption_cert)

      encrypted_ar, key = encrypt_ar

      encrypted_key = encrypt_key(key, encryption_public_key)

      build_encrypted_ar(encryption_cert, encrypted_key, encrypted_ar)
    end

    # Encrypts a given symmetric encryption key with a public key and returns it in base64 encoded
    # format
    def encrypt_key(key, public_key)
      encrypted_key = public_key.public_encrypt(key)
      Base64.encode64(encrypted_key)
    end

    # Encrypts the application request and returns it in base64 encoded format.
    # Also returns the key needed to decrypt it
    def encrypt_ar
      cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt

      key = cipher.random_key
      iv = cipher.random_iv

      encrypted_data = cipher.update(Nokogiri::XML(@ar).to_xml)
      encrypted_data << cipher.final
      encrypted_data = iv + encrypted_data
      encrypted_data = Base64.encode64(encrypted_data)
      return encrypted_data, key
    end

    def build_encrypted_ar(cert, encrypted_data, encrypted_key)
      asym_enc_algorithm = 'http://www.w3.org/2001/04/xmlenc#tripledes-cbc'
      sym_enc_algorithm = 'http://www.w3.org/2001/04/xmlenc#rsa-1_5'

      Nokogiri::XML::Builder.new :encoding => 'UTF-8' do |xml|
        xml['xenc'].EncryptedData('xmlns:xenc' => "http://www.w3.org/2001/04/xmlenc#",
                                  'Type' => "http://www.w3.org/2001/04/xmlenc#Element") do
          xml.EncryptionMethod('Algorithm' => asym_enc_algorithm)

          xml['dsig'].KeyInfo('xmlns:dsig' => "http://www.w3.org/2000/09/xmldsig#") do
            xml['xenc'].EncryptedKey('Recipient' => "name:DanskeBankCryptCERT") do
              xml.EncryptionMethod('Algorithm' => sym_enc_algorithm)
              xml['dsig'].KeyInfo do
                xml.X509Data { xml.X509Certificate cert }
              end
              xml['xenc'].CipherData { xml.CipherValue encrypted_data }
            end
          end

          xml['xenc'].CipherData { xml.CipherValue encrypted_key }
        end
      end
    end

    def set_generic_request_contents(body,
                                     sender_id,
                                     request_id,
                                     lang,
                                     receiver_id)
      set_node(body, 'bxd|SenderId', sender_id)
      set_node(body, 'bxd|RequestId', request_id)
      set_node(body, 'bxd|Timestamp', Time.now.utc.iso8601)
      set_node(body, 'bxd|Language', lang)
      set_node(body, 'bxd|UserAgent',"Sepa Transfer Library version " + VERSION)
      set_node(body, 'bxd|ReceiverId', receiver_id)
    end

    def set_create_cert_contents(body)
      set_node(body, 'pkif|SenderId', @customer_id)
      set_node(body, 'pkif|CustomerId', @customer_id)
      set_node(body, 'pkif|RequestId', @request_id)
      set_node(body, 'pkif|Timestamp', Time.now.utc.iso8601)
      set_node(body, 'pkif|InterfaceVersion', 1)
      set_node(body, 'pkif|Environment', @environment)
    end

    def set_bank_certificate_contents(body)
      set_node(body, 'pkif|SenderId', @customer_id)
      set_node(body, 'pkif|CustomerId', @customer_id)
      set_node(body, 'pkif|RequestId', @request_id)
      set_node(body, 'pkif|Timestamp', Time.now.utc.iso8601)
      set_node(body, 'pkif|InterfaceVersion', 1)
    end

    def build_danske_generic_request
      body = load_body_template
      header = load_header_template(@template_path)

      set_generic_request_contents(body, @customer_id, @request_id, @language, @target_id)
      encrypted_request = encrypt_application_request
      add_encrypted_generic_request_to_soap(encrypted_request, body)

      process_header(header,body)
      add_body_to_header(header,body)
    end

    def build_certificate_request
      body = load_body_template

      set_create_cert_contents(body)
      encrypted_request = encrypt_application_request
      add_encrypted_request_to_soap(encrypted_request, body)
    end

    def build_get_bank_certificate_request
      body = load_body_template

      set_bank_certificate_contents(body)
      add_bank_certificate_body_to_soap(body)
    end

    def add_encrypted_request_to_soap(encrypted_request, body)
      encrypted_request = Nokogiri::XML(encrypted_request.to_xml)
      encrypted_request = encrypted_request.root
      body.at_css('pkif|CreateCertificateIn').add_child(encrypted_request)

      body
    end

    def add_encrypted_generic_request_to_soap(encrypted_request, body)
      encrypted_request = Nokogiri::XML(encrypted_request.to_xml)
      encrypted_request = encrypted_request.root
      encrypted_request = Base64.encode64(encrypted_request.to_xml)
      body.at_css('bxd|ApplicationRequest').add_child(encrypted_request)

      body
    end

    def add_bank_certificate_body_to_soap(body)
      ar = Nokogiri::XML(Base64.decode64(@ar))

      ar = ar.at_css('elem|GetBankCertificateRequest')
      body.at_css('pkif|GetBankCertificateIn').add_child(ar)

      body
    end
  end
end
