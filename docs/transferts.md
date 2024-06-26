# transferts (tra)

With the document transfer service of CARA (transferts (tra)) the following use cases are supported:

* A primary system submits medical documents to CARA addressing it to the desired recipient healthcare professional (
  HCP).
* CARA notifies subscribed HCPs that a primary system transferred a new medical document to her/ him.
* The HCP can access the portal and view the received medical document. Additionally, CARA delivers the medical document
  to subscribed HCPs by email. Primary system can retrieve via web service all those transferred documents for the
  specific user.

Authentication between primary systems and CARA endpoints is done via client certificate TLS mutual authentication. The
HCP must provide this client certificate including the certificate chain (.pem format, unprotected, base64, x509) and
let it register by CARA. The HCPs GLN must be part of this certificate.

Retrieval of medical documents requires an authorization token (SAML assertion). The assertion must be requested by the
system from the B2B STS with the client certificate containing the GLN. The assertion validity period of the B2B STS is
15 minutes.

The integration system is can be found [here](https://b2b.cara.int.post-ehealth.ch/).

## Transactions

- 104 – **Request Security Token**: To authenticate and extract the SAML assertion.
- 100 - **PIXV3 Query** (ITI-45): To search for a patient in the Master Patient Index with their AHV number and 
  retrieve their identifiers if they are already known in the CARA B2B platform (optional).
- 102 – **Provider Information Query** (ITI-58): To search for the recipient(s) of the documents to exchange in the 
  Healthcare Provider Directory.
- 106 – **submitDocuments**: To send the document(s) to the recipient(s).
- 200 – **GetDocumentList**: To retrieve the list of documents to download as a recipient.
- 202 – **Registry Stored Query** (ITI-18): To retrieve the document metadata from the XDS registry.
- 204 – **Retrieve Document Set** (ITI-43): To retrieve the document from the XDS repository.
- 206 – **DeleteDocumentList**: To delete the document(s) from the recipient's document list.

## eprik integration with transferts (tra)

EPRIK supports the development during the integration with the predefined HCP **2000040030829** configured that the
primary systems can use the transaction without authentication / authorization.

1. An authorization token can be received for HCP
   2000040030829 [request](https://test.ahdis.ch/eprik-cara/index.html#/transaction/b9ea0e8f-e6f9-4a05-821d-62a3d81bb732)
2. Send a document with HCP 2000040030829 as recipient and
   sender [request](https://test.ahdis.ch/eprik-cara/index.html#/transaction/ebee3a52-196d-4f79-9096-7416bddcc6b1)
3. Receive the document list for HCP
   2000040030829 [request](https://test.ahdis.ch/eprik-cara/index.html#/transaction/d049c82f-4a43-405d-a55d-00972b3da34f)
4. Download the document for HCP
   2000040030829 [request](https://test.ahdis.ch/eprik-cara/index.html#/transaction/41ff6501-2762-415f-8bf2-b7d4a635f313)
5. Delete a document for HCP
   2000040030829 [request](https://test.ahdis.ch/eprik-cara/index.html#/transaction/88c7c97a-7fa5-4be2-a907-ade126b2b2f4) (
   TODO: update after transaction name has been added)
