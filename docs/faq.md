## FAQ Integration Requests

### HTTP Error code 202 for SOAP Request (e.g. ITI-18)

check that in the SOAP WS:Header the `<Address>` element is in the same nampespace as the `<ReplyTo>` Element:

```xml

<a:ReplyTo s:mustUnderstand="true" xmlns:a="http://www.w3.org/2005/08/addressing">
    <a:Address>http://www.w3.org/2005/08/addressing/anonymous</a:Address>
</a:ReplyTo>
```

### Content-Type returned not multipart/related but application/xml

ITI-TF says that one should use _multipart/related_,
see [ITI-43 §3.43.5.1.1.1](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html#3.43.5.1.1.1),
verify that you have `start-info="application/soap+xml; charset=utf-8"` (or no `start-info`).

e.g:

```
Content-Type: multipart/related; boundary="uuid:f42c35e4-54b2-45ca-8fda-ed58b11f6fce";type="application/xop+xml"; start=" <root.message@cxf.apache.org>";start-info="application/soap+xml; charset=utf-8"
```

Please check also that the `<xop:Include>` has no whitespace/linebreaks before or after the
tag [source](https://profiles.ihe.net/ITI/TF/Volume2/ch-V.html#Appendix%20V:~:text=Example%20of%20XOP-,optimized,-content.%C2%A0%20NOTE%3A%C2%A0%20xop),
with linebreaks you get an HTTP 500 error (currently the EPR Integration kit shows it all the time wrapped, verify it
with download request).

### STS error 500 with TCU

if some STS TCU requests work and some not, check that you are in sync with the NTP time server, even below second
differences can provoke
that the assertion could be in the future for the STS (notBefore element,
see [issue](https://github.com/ahdis/ch-emed-pmp/issues/40))

check also that you have no xml comments in request

### ITI-41: HTTP Error code 500 (soap:body no line breaks in requests)

2024-04-25: if the soap body is formatted with line breaks in the request, the request will not go through the back
end (warning: empty request) and an http error 500 is returned, see xop:include comment above

### ITI-45: No MPI-PID in ITI-45 response if queried with AHVN13

This is a data problem. Multiple local patients were either automatically or manually merged into the same master
patient.

### ITI-45: No Patient data returned

Verify that the receiver id in the hl7 v3 message contains the oid for the integration system (
2.16.756.5.30.1.191.1.0.12.1.101.2);

### IdP HIN ID

1. you need to have a GLN assigned to the HIN user that, otherwise the STS [ITI-40] will not work since the NameID is
   not known
2. the test HIN ID expires after six months

### IdP TRUST ID

1. if you authenticate with trust ID and eprik you have to provide the SAML2 NameID to be configured
2. you can get test trust id [here](https://register-int.trustid.ch/trustid) and manage
   it [here](https://my-int.trustid.ch)

### Verify if TCU certificate is correctly installed

for the [STS request](https://test.ahdis.ch/eprik-cara/#/transaction/1b60dd65-182a-4faf-8df7-edb70ef3184b) the public
certificate is added in the `<ds:X509Certificate>` in the `<saml2:Assertion>`. You can get the fingerprint of it copying
the content of the `<ds:X509Certificate>` into the echo '' part:

```
echo 'MII... =' | base64 -d | openssl x509 -noout -text -fingerprint -sha1
```

The resulting sha1 Fingerprint=73:85:78:C8:C8:0C:DE:5D:7A:3E:06:38:6B:80:6E:65:47:FB:61:18 can be checked in the cara
admin portal if the certificate is available there.
For the STS request it is important that the oid attributed to the user/certificate (showing in parentheses) in also
added in the STS request in the `<saml2:NameID>`.

### Logs ATNA with XUA

The current platform has an issue processing ATNA logs with XUA information.
Currently, you need to only provide one `ActiveParticipant` for the XUA, instead of two or three (as specified in the
[Extension 1 to Annex 5](https://www.fedlex.admin.ch/eli/oc/2023/221/de/annexes)).
Otherwise, the log will not be properly processed, but discarded by the platform.

This should be fixed with version 6.0 of the platform.
