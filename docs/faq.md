## FAQ Integration Requests

### HTTP Error code 202 for SOAP Request (e.g. ITI-18)

check that in the SOAP WS:Header the Address element is in the same nampespace as the ReplateTo Element:

```xml
    <a:ReplyTo s:mustUnderstand="true" xmlns:a="http://www.w3.org/2005/08/addressing">
      <a:Address>http://www.w3.org/2005/08/addressing/anonymous</a:Address>
    </a:ReplyTo>
```

### IdP HIN ID

1. you need to have a GLN assigned to the HIN user that, otherwise the STS [ITI-40] will not work since the NameID is not known
2. the test HIN ID expires after six months

### IdP TRUST ID

1. if you authenticate with trust ID and eprik you have to provide the SAML2 NameID to be configured
2. you can get test trust id [here](https://register-int.trustid.ch/trustid)