# transferts (tra)

With the document transfer service of CARA (transferts (tra)) the following use cases are supported: 

* A primary system submits medical documents to CARA addressing it to the desired recipient healthcare professional (HCP). 
* CARA notifies subscribed HCPs that a primary system transferred a new medical document to her/ him. 
* The HCP can access the portal and view the received medical document. Additionally, CARA delivers the medical document to subscribed HCPs by email. Primary system can retrieve via web service all those transferred documents for the specific user.

Authentication between primary systems and CARA endpoints is done via client certificate TLS mutual authentication. The HCP must provide this client certificate including the certificate chain (.pem format, unprotected, base64, x509) and let it register by CARA. The HCPs GLN must be part of this certificate.

Retrieval of medical documents requires an authorization token (SAML assertion). The assertion must be requested by the system from the B2B STS with the client certificate containing the GLN. The assertion validity period of the B2B STS is 15 minutes.


## eprik integration with transferts (tra)

EPRIK supports the development during the integration with a predefined HCP configured that the primary systems can use
the transaction without authentication / authorization.

1. An authorization token can be received for HCP 2000040030829
2. Send a document with HCP 2000040030829 as recipient and sender
3. Receive the document list for HCP 2000040030829
4. Download the document for HCP 2000040030829  