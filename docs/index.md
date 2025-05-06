# Primary system integration with CARA

!!! note

    05.05.2025 ATNA IP changed for eprik-cara, it is now 37.156.40.86 (or atna.test.ahdis.ch)

    22.9.2023 Release  5.0.2: No changes in API 

    29.3.2023: Release 5.0.0 on CARA INT: The EPR CARA integration version is newer than the production version, see [changelog](changelog.md) for differences.

This documentation describes how the [Integration Kit](https://test.ahdis.ch/eprik-cara/index.html) can be used to test
the integration of a primary system with the [CARA](https://www.cara.ch/) integration system.

CARA offers different services:

- EPR [https://epr.cara.int.post-ehealth.ch](https://epr.cara.int.post-ehealth.ch)
- Transferts [https://b2b.cara.int.post-ehealth.ch/](https://b2b.cara.int.post-ehealth.ch/).
- PMP (eMedication
  Service) [https://cara-ch.github.io/emed-service-guide/](https://cara-ch.github.io/emed-service-guide/)

To access the integration system you will need to sign a contract/CGUE with [CARA](https://www.cara.ch/) and provide an
OID concept for your organization,
in return you will get:

- an HCP test user for which you need an online authentication yourself (e.g. HIN ID) and connect that HCP test user
  with your online authentication
- two test patients for you with patient access, public test patients are listed [here](testpatients.md)
- access to the [Post E-Health Platform – developer portal](https://developer.post.ch/en/e-health) for the EPR
  integration.

This will allow you to start the integration of the primary system.

The [Integration Kit](https://test.ahdis.ch/eprik-cara/index.html) (short **EPRIK**) provides the
following [functionality](usecases.md):

- Authenticate an User and obtain an IdP assertion
- Proxy and log IHE transactions without client certificates and with basic validation of request / response

<figure markdown>
  ![Image title](img/eprik-architecture.png){ width="499" }
  <figcaption>Integration architecture</figcaption>
</figure>

This allows a primary system to do a stepwise integration. The integration kit is only
an add-on during development, testing and **CANNOT BE** used with a production environment.

!!! danger

    Use only test data and no real patient data! EPRIK is completely open 
    and every request / response to the integration system made is retrievable.

## Testing the TLS connection with CARA INT

There are two different TLS connections with CARA INT you can test: the Syslog connection (to send ATNA messages) 
and the webservices connection (to send IHE requests).

In these tests, you have to use your own certificate and private key.
Note that they may be stored in the same _[.pem](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail)_ file.

### Syslog connection

You can test the Syslog connection with `openssl`:
```bash
openssl s_client -connect syslog-int.post-ehealth.ch:7003 -cert cert.pem -key private_key.pem
```

In case of success, you will see "_read R BLOCK_" as last line of the output, and you should be able to send data in 
the connection (the command should not have returned).

If the command returns, and/or the last output line is "_closed_", then the connection failed.
In case of error, you can increase the log levels with the parameters `-state -debug -msg -prexit`.

### Webservices connection

You can test the webservices connection with `curl`:
```bash
curl --cert cert.pem --key private_key.pem https://ws.epr.cara.int.post-ehealth.ch:443
```

In case of success, you will see the content of the "HTTP 404 - Not Found" page of the Post.
In case of error, you may see an error like "_curl: (56) OpenSSL SSL_read: error:14094410:SSL 
routines:ssl3_read_bytes:sslv3 alert handshake failure, errno 0_".

!!! warning

    We had errors testing the Webservices connection with `openssl`, although it is working fine for the Syslog 
    connection at the same time.
