## FAQ Integration Requests

### HTTP Error code 202 for SOAP Request (e.g. ITI-18)

check that in the SOAP WS:Header the Address element is in the same nampespace as the ReplateTo Element:

```xml
    <a:ReplyTo s:mustUnderstand="true" xmlns:a="http://www.w3.org/2005/08/addressing">
      <a:Address>http://www.w3.org/2005/08/addressing/anonymous</a:Address>
    </a:ReplyTo>
```

### Content-Type returned not multipart/related but application/xml 

TI-TF says that one should use multipart/related, see https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html#3.43.5.1.1.1, verify that you have start-info="application/soap+xml; charset=utf-8" (or no start-info)

e.g:

```
Content-Type: multipart/related; boundary="uuid:f42c35e4-54b2-45ca-8fda-ed58b11f6fce";type="application/xop+xml"; start=" <root.message@cxf.apache.org>";start-info="application/soap+xml; charset=utf-8"
```

### spurios STS error 500 with TCU

if some STS TCU requests work and some not, check that you are in sync with the ntp time server, even below second differencds can provoke
that the assertion could be in the future for the STS (notBefore element, see [issue](https://github.com/ahdis/ch-emed-pmp/issues/40)

### IdP HIN ID

1. you need to have a GLN assigned to the HIN user that, otherwise the STS [ITI-40] will not work since the NameID is not known
2. the test HIN ID expires after six months

### IdP TRUST ID

1. if you authenticate with trust ID and eprik you have to provide the SAML2 NameID to be configured
2. you can get test trust id [here](https://register-int.trustid.ch/trustid)