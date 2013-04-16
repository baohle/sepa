require 'savon'

def get_user_info
    client = Savon.client(wsdl: "BankCorporateFileService_20080616.xml", pretty_print_xml: true)

    response = client.call(:get_user_info, xml: %(<soapenv:Envelope xmlns:cor="http://bxd.fi/CorporateFileService" xmlns:mod="http://model.bxd.fi" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
    <soapenv:Header>
        <wsse:Security soapenv:mustUnderstand="1" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
            <wsse:BinarySecurityToken EncodingType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-soap-message-security-1.0#Base64Binary" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3" wsu:Id="CertId-9502902" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">MIID+jCCAuKgAwIBAgIEAMdxxTANBgkqhkiG9w0BAQUFADBsMQswCQYDVQQGEwJTRTEeMBwGA1UEChMVTm9yZGVhIEJhbmsgQUIgKHB1YmwpMScwJQYDVQQDEx5Ob3JkZWEgcm9sZS1jZXJ0aWZpY2F0ZXMgQ0EgMDExFDASBgNVBAUTCzUxNjQwNi0wMTIwMB4XDTA5MDYxMTEyNTAxOVoXDTExMDYxMTEyNTAxOVowcjELMAkGA1UEBhMCU0UxIDAeBgNVBAMMF05vcmRlYSBEZW1vIENlcnRpZmljYXRlMRQwEgYDVQQEDAtDZXJ0aWZpY2F0ZTEUMBIGA1UEKgwLTm9yZGVhIERlbW8xFTATBgNVBAUTDDAwOTU1NzI0Mzc3MjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAwcgz5AzbxTbsCE51No7fPnSqmQBIMW9OiPkiHotwYQTl+H9qwDvQRyBqHN26tnw7hNvEShd1ZRGUg4drMEXDV5CmKqsAevs9lauWDaHnGKPNHZJ1hNNYXHwymksEz5zMnG8eqRdhb4vOV2FzreJeYpsgx31Bv0aTofHcHVz4uGcCAwEAAaOCASAwggEcMAkGA1UdEwQCMAAwEQYDVR0OBAoECEj6Y9/vU03WMBMGA1UdIAQMMAowCAYGKoVwRwEDMBMGA1UdIwQMMAqACEIFjfLBeTpRMDcGCCsGAQUFBwEBBCswKTAnBggrBgEFBQcwAYYbaHR0cDovL29jc3Aubm9yZGVhLnNlL1JDQTAxMA4GA1UdDwEB/wQEAwIGQDCBiAYDVR0fBIGAMH4wfKB6oHiGdmxkYXA6Ly9sZGFwLm5iLnNlL2NuPU5vcmRlYSUyMHJvbGUtY2VydGlmaWNhdGVzJTIwQ0ElMjAwMSxvPU5vcmRlYSUyMEJhbmslMjBBQiUyMChwdWJsKSxjPVNFP2NlcnRpZmljYXRlcmV2b2NhdGlvbmxpc3QwDQYJKoZIhvcNAQEFBQADggEBAEXUv87VpHk51y3TqkMb1MYDqeKvQRE1cNcvhEJhIzdDpXMA9fG0KqvSTT1e0ZI2r78mXDvtTZnpic44jX2XMSmKO6n+1taAXq940tJUhF4arYMUxwDKOso0Doanogug496gipqMlpLgvIhGt06sWjNrvHzp2eGydUFdCsLr2ULqbDcut7g6eMcmrsnrOntjEU/J3hO8gyCeldJ+fI81qarrK/I0MZLR5LWCyVG/SKduoxHLX7JohsbIGyK1qAh9fi8l6X1Rcu80v5inpu71E/DnjbkAZBo7vsj78zzdk7KNliBIqBcIszdJ3dEHRWSI7FspRxyiR0NDm4lpyLwFtfw=</wsse:BinarySecurityToken>
            <ds:Signature Id="Signature-22310861" xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
                <ds:SignedInfo>
                    <ds:CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
                    <ds:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
                    <ds:Reference URI="#id-23633426">
                        <ds:Transforms>
                            <ds:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
                        </ds:Transforms>
                        <ds:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
                        <ds:DigestValue>yYMMbQhYZ/LAx5eIoQh5UNtJ2TE=</ds:DigestValue>
                    </ds:Reference>
                </ds:SignedInfo>
                <ds:SignatureValue>
ncmFWb7Lhhl2csPI27H5k1i30vQoox/2wKZ36aI9ruN4zDnofWr+KSZUbGIqffxeAsIOudktcF0A
roeoKQEIRZSkq63qbyF/QbHe7Xm5m9qc6jNvtDAzvIwBUDNOU+fdvjhzRHd8Y/5Mh5D2BLy25uWl
sMb/ytIyJtNN20x+brQ=
</ds:SignatureValue>
                <ds:KeyInfo Id="KeyId-7874168">
                    <wsse:SecurityTokenReference wsu:Id="STRId-2471808" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
                        <wsse:Reference URI="#CertId-9502902" ValueType="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-x509-token-profile-1.0#X509v3"/>
                    </wsse:SecurityTokenReference>
                </ds:KeyInfo>
            </ds:Signature>
        </wsse:Security>
    </soapenv:Header>
    <soapenv:Body wsu:Id="id-23633426" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
        <cor:getUserInfoin>
            <mod:RequestHeader>
                <mod:SenderId>1</mod:SenderId>
                <mod:RequestId>2</mod:RequestId>
                <mod:Timestamp>2010-06-23T14:00:08Z</mod:Timestamp>
                <mod:Language>FI</mod:Language>
                <mod:UserAgent>Petri</mod:UserAgent>
                <mod:ReceiverId>3</mod:ReceiverId>
            </mod:RequestHeader>
            <mod:ApplicationRequest>PEFwcGxpY2F0aW9uUmVxdWVzdCB4bWxucz0iaHR0cDovL2J4ZC5maS94bWxkYXRhLyI+PEN1c3RvbWVySWQ+Njc5MTU1MzMwPC9DdXN0b21lcklkPjxDb21tYW5kPkdldFVzZXJJbmZvPC9Db21tYW5kPjxUaW1lc3RhbXA+MjAxMC0wNS0xMFQxMzoyMjoxOS44NDcrMDM6MDA8L1RpbWVzdGFtcD48RW52aXJvbm1lbnQ+UFJPRFVDVElPTjwvRW52aXJvbm1lbnQ+PFNvZnR3YXJlSWQ+UGV0cmk8L1NvZnR3YXJlSWQ+PFNpZ25hdHVyZSB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnIyI+PFNpZ25lZEluZm8+PENhbm9uaWNhbGl6YXRpb25NZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy14bWwtYzE0bi0yMDAxMDMxNSIgLz48U2lnbmF0dXJlTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnI3JzYS1zaGExIiAvPjxSZWZlcmVuY2UgVVJJPSIiPjxUcmFuc2Zvcm1zPjxUcmFuc2Zvcm0gQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjZW52ZWxvcGVkLXNpZ25hdHVyZSIgLz48L1RyYW5zZm9ybXM+PERpZ2VzdE1ldGhvZCBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvMDkveG1sZHNpZyNzaGExIiAvPjxEaWdlc3RWYWx1ZT5VOXRzVDRsclJNcDhaZEtNbmJsZ2VNQ0dmdkk9PC9EaWdlc3RWYWx1ZT48L1JlZmVyZW5jZT48L1NpZ25lZEluZm8+PFNpZ25hdHVyZVZhbHVlPmRmZ2lGTWdTZUZWT3NndkZBR2ZLekNqM1pKRFY4NElDK2hZZ25mVGxJZWhCUlNkQ3JMTloweHgvbjNUREc2eENKK3VreTlBZG55S1g1MDdjSVJyeC9YZ0J5djIzMFVra3U3dGVFN0tsNXlmUkR1TFNnUUs3bnJMc2NzMGR0c29uR0trRnJWOTFIUzZkOUU0NHhrMXUwUWRKZkEyWXFjOWI5RlZjVk9ScXRQZz08L1NpZ25hdHVyZVZhbHVlPjxLZXlJbmZvPjxYNTA5RGF0YT48WDUwOUlzc3VlclNlcmlhbD48WDUwOUlzc3Vlck5hbWU+U3lzdGVtLlNlY3VyaXR5LkNyeXB0b2dyYXBoeS5YNTA5Q2VydGlmaWNhdGVzLlg1MDBEaXN0aW5ndWlzaGVkTmFtZTwvWDUwOUlzc3Vlck5hbWU+PFg1MDlTZXJpYWxOdW1iZXI+MTMwNzA3ODk8L1g1MDlTZXJpYWxOdW1iZXI+PC9YNTA5SXNzdWVyU2VyaWFsPjxYNTA5Q2VydGlmaWNhdGU+TUlJRCtqQ0NBdUtnQXdJQkFnSUVBTWR4eFRBTkJna3Foa2lHOXcwQkFRVUZBREJzTVFzd0NRWURWUVFHRXdKVFJURWVNQndHQTFVRUNoTVZUbTl5WkdWaElFSmhibXNnUVVJZ0tIQjFZbXdwTVNjd0pRWURWUVFERXg1T2IzSmtaV0VnY205c1pTMWpaWEowYVdacFkyRjBaWE1nUTBFZ01ERXhGREFTQmdOVkJBVVRDelV4TmpRd05pMHdNVEl3TUI0WERUQTVNRFl4TVRFeU5UQXhPVm9YRFRFeE1EWXhNVEV5TlRBeE9Wb3djakVMTUFrR0ExVUVCaE1DVTBVeElEQWVCZ05WQkFNTUYwNXZjbVJsWVNCRVpXMXZJRU5sY25ScFptbGpZWFJsTVJRd0VnWURWUVFFREF0RFpYSjBhV1pwWTJGMFpURVVNQklHQTFVRUtnd0xUbTl5WkdWaElFUmxiVzh4RlRBVEJnTlZCQVVURERBd09UVTFOekkwTXpjM01qQ0JuekFOQmdrcWhraUc5dzBCQVFFRkFBT0JqUUF3Z1lrQ2dZRUF3Y2d6NUF6YnhUYnNDRTUxTm83ZlBuU3FtUUJJTVc5T2lQa2lIb3R3WVFUbCtIOXF3RHZRUnlCcUhOMjZ0bnc3aE52RVNoZDFaUkdVZzRkck1FWERWNUNtS3FzQWV2czlsYXVXRGFIbkdLUE5IWkoxaE5OWVhId3lta3NFejV6TW5HOGVxUmRoYjR2T1YyRnpyZUplWXBzZ3gzMUJ2MGFUb2ZIY0hWejR1R2NDQXdFQUFhT0NBU0F3Z2dFY01Ba0dBMVVkRXdRQ01BQXdFUVlEVlIwT0JBb0VDRWo2WTkvdlUwM1dNQk1HQTFVZElBUU1NQW93Q0FZR0tvVndSd0VETUJNR0ExVWRJd1FNTUFxQUNFSUZqZkxCZVRwUk1EY0dDQ3NHQVFVRkJ3RUJCQ3N3S1RBbkJnZ3JCZ0VGQlFjd0FZWWJhSFIwY0RvdkwyOWpjM0F1Ym05eVpHVmhMbk5sTDFKRFFUQXhNQTRHQTFVZER3RUIvd1FFQXdJR1FEQ0JpQVlEVlIwZkJJR0FNSDR3ZktCNm9IaUdkbXhrWVhBNkx5OXNaR0Z3TG01aUxuTmxMMk51UFU1dmNtUmxZU1V5TUhKdmJHVXRZMlZ5ZEdsbWFXTmhkR1Z6SlRJd1EwRWxNakF3TVN4dlBVNXZjbVJsWVNVeU1FSmhibXNsTWpCQlFpVXlNQ2h3ZFdKc0tTeGpQVk5GUDJObGNuUnBabWxqWVhSbGNtVjJiMk5oZEdsdmJteHBjM1F3RFFZSktvWklodmNOQVFFRkJRQURnZ0VCQUVYVXY4N1ZwSGs1MXkzVHFrTWIxTVlEcWVLdlFSRTFjTmN2aEVKaEl6ZERwWE1BOWZHMEtxdlNUVDFlMFpJMnI3OG1YRHZ0VFpucGljNDRqWDJYTVNtS082bisxdGFBWHE5NDB0SlVoRjRhcllNVXh3REtPc28wRG9hbm9ndWc0OTZnaXBxTWxwTGd2SWhHdDA2c1dqTnJ2SHpwMmVHeWRVRmRDc0xyMlVMcWJEY3V0N2c2ZU1jbXJzbnJPbnRqRVUvSjNoTzhneUNlbGRKK2ZJODFxYXJySy9JME1aTFI1TFdDeVZHL1NLZHVveEhMWDdKb2hzYklHeUsxcUFoOWZpOGw2WDFSY3U4MHY1aW5wdTcxRS9Ebmpia0FaQm83dnNqNzh6emRrN0tObGlCSXFCY0lzemRKM2RFSFJXU0k3RnNwUnh5aVIwTkRtNGxweUx3RnRmdz08L1g1MDlDZXJ0aWZpY2F0ZT48L1g1MDlEYXRhPjwvS2V5SW5mbz48L1NpZ25hdHVyZT48L0FwcGxpY2F0aW9uUmVxdWVzdD4=
</mod:ApplicationRequest>
        </cor:getUserInfoin>
    </soapenv:Body>
</soapenv:Envelope>))
end

get_user_info
