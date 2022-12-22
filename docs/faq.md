## FAQ Integration Requests

### HTTP Error code 202 for SOAP Request (e.g. ITI-18)

check that in the SOAP WS:Header the Address element is in the same nampespace as the ReplateTo Element:

```xml
    <a:ReplyTo s:mustUnderstand="true" xmlns:a="http://www.w3.org/2005/08/addressing">
      <a:Address>http://www.w3.org/2005/08/addressing/anonymous</a:Address>
    </a:ReplyTo>
```