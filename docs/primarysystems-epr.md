For a deep EPR integration into a primary systems the following usecases should be covered

1. Integrate the strong authentication into the primary system with an IdP
2. Search for patients in the community
3. Register a patient from the primary system in the community
4. Query and retrieve documents for a patient from the EPR including authorization
5. Publish documents for a patient by a healthcare professional
6. Providing AuditEvents
   
e-health-suisse has described the different steps with examples [here](https://www.e-health-suisse.ch/fr/technique-semantique/raccordement-dep/techniciens.html). Please find below additional information relevant for CARA and EPRIK.

## 1. Integrate the strong authentication into the primary system with and IdP

Authenticate a user at an identity provider certified for the Swiss EPR. Primary systems need to use this transaction to retrieve a IdP assertion. The IdP assertion is required to retrieve the XUA Assertion to be used with EPR transactions. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/AuthenticateUser.md).

See EPRIK example for [AuthnRequest](https://test.ahdis.ch/eprik-cara/index.html#/transaction/5dc8c8d9-705e-4006-874e-e03ff7c4f434) and [ArtifactResolve](https://test.ahdis.ch/eprik-cara/index.html#/transaction/eabdcf9b38f9fc31c85b33835493db9d55028ca9).

If you have a test user you can [use the IdP Assertion from EPRIK](usecases/#use-the-idp-assertion-from-eprik) until you have done the IdP integration yourself.

## 2. Search for patients in the community

### 2.1 Check if the patient has an EPR based on AHVN13/NAVS

With the PIX V3 query You can use AHVN13/NAVS13 to check if the patient has an EPR (EPR-SPID is returned), and if the patient
is already registered in the community (MPI-PID is returned). See example [request](https://test.ahdis.ch/eprik-cara/index.html#/transaction/d34f0a4f-cf1a-4155-a0d4-f5c915a725ea) for patient Gassmann, which returns EPR-SPID and MPI-PID in asOtherIDs element. For a test patient who has no EPR (as of 4.1.2023) with AHVN13 7560521127080 no EPR-SPID and MPI-PID is returned, see [request](https://test.ahdis.ch/eprik-cara/index.html#/transaction/38972f41-33ab-4809-be91-faf44362eada). For a test patient who has an EPR but not in CARA int (as of 4.1.2023) with AHVN13 7560520619845 only EPR-SPID is returned, see [request](https://test.ahdis.ch/eprik-cara/index.html#/transaction/b8291740-b464-45de-ac25-176e28a6a4a6). 

### 2.2 Demographics Query

A search for a a patient is done via a demographics query. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/PDQ.md). 

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/e86d22ce-647d-4d1d-a611-6ae2464683ae). This example search is done on the family name, other demographics query parameters are possible. Please note that Swiss Extension requires that an error is returned if more than 5 matched would be returned. You need to provide creationTime, sender OID and receiver OID in addition to the query parameters in the request. For the communication you need a client certificate but with EPRIK a client certificate is not necessary. 


## 3. Register a patient from the primary system in the community and query the patient community id

### 3.1 Register local patient Id in the community

Register a patient in a community. Primary systems need to use this transaction to register patient data and then to be able to provide and retrieve documents to the patients EPR. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/PIXFeed.md).

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/22915696-7258-4c3f-b223-658deb4a8c88). This example registers the local id from the primary system P001 of the patient identity domain 2.16.756.5.30.1.999.90 in the MPI. You need to provide creationTime, sender OID and receiver OID in addition to the patient parameters (EPR-SPID, MPI-ID) in the request. For the communication you need a client certificate, but with EPRIK a client certificate is not necessary.

### 3.2 Query MPI-PID and EPR-SPID based on local ID 

The primary systems needs to query the master patient ID (MPI-ID) for patients to retrieve or provide documents for, based on the local id registered above. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/PIXQuery.md).

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/73566a45-4696-4a3c-9c6a-f8245ec4be8a).

## 4. Query and retrieve documents for a patient from the EPR

### 4.1 Authorization

To query and retrieve documents the HCP needs to be authorized based on the IdP token, the patient (resourceID with EPR-SPID), purposeOfUse (NORM, EMER) and role (HCP).
See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/GetXAssertion.md).

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/b62996b2-da1b-49ba-98f1-e64d7123154e).

Example STS requests with [IdP](requests/sts.http) or [EPRIK-httpheader](requests/sts-idp-httpheader.http).

### 4.2a Query documents from the CARA community
Retrieve the document metadata for the documents stored in a patients EPR for the CARA community. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/RegistryStoredQuery.md).

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/ab4049f8-ba33-4d84-b9a5-d094ce4117aa). For the Query the MPI-ID of the patient needs to be added. This example requests includes the security token necessary. With the EPRIK you can do the user authentication there and reuse the token [see](usecases/#use-the-idp-assertion-from-eprik). For the communication you need a client certificate but with EPRIK a client certificate is not necessary.

### 4.2b Query documents from remote communities
To retrieve the document metadata for the documents stored in a patients EPR but registered in remote communities, the initiating gateway has to be called with an IIT-18 query. EPRIK example [request, response](https://test.ahdis.ch/eprik-proxy-cara/index.html#/transaction/fc3082b6-fbdf-4211-813c-2507a4854108). Gassmann has an example document in the remote community urn:oid:2.16.756.5.30.1.177.1.0.

### 4.3a Retrieve documents from the CARA community

To retrieve documents from a patients EPR the IHE XDS.b profile and transactions needs to be used. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/RetrieveDocumentSet.md).

EPRIK example [request,response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/6a6ee447-a842-44f6-bc29-b8a35d14c5e1). With  EPRIK you can do the user authentication there and reuse the token [see](usecases/#use-the-idp-assertion-from-eprik). For the communication you need a client certificate but with EPRIK a client certificate is not necessary. You will need to add the HomeCommunityId, RepositoryUniqueId and DocumentUniqueId.

### 4.3b Retrieve documents from remote communities
To retrieve the documents stored in remote communities, the initiating gateway has to be called with an IIT-43 query with the homeCommunityId added from result 4.2b. EPRIK example [request, response](https://test.ahdis.ch/eprik-proxy-cara/index.html#/transaction/cb470a7b-f7b8-4449-a417-9620cc09a909).


## 5. Publish documents for a patient by a healthcare professional

To provide documents and metadata about the documents the IHE XDS.b profile and transactions needs to be used. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/ProvideAndRegister.md).

EPRIK example [request,response](https://test.ahdis.ch/eprik-cara/#/transaction/78b7b807-b9db-4314-8463-ffc5a9a6fdf6). With  EPRIK you can do the user authentication there and reuse the token [see](usecases/#use-the-idp-assertion-from-eprik). For the communication you need a client certificate but with EPRIK a client certificate is not necessary. You will need to add metadata for the document.

### confidentiality code in metadata
The patient can set the default level of confidentiality to normally accessible	, restricted accessible	or secret. This need to be taken into account when publishing ([sequence diagram](https://ehealthsuisse.ihe-europe.net/docs/sequence_diagrams/2_03_EPR_HPStoreDocuments.plantuml.png)). If a publication fails for normally accessible it has to be retried with restricted accessible. It is only possible to publish a document with confidentiality secret if the user has set the default confidentiality code to secret. To test this three different patients have been setup with different confidentiality codes: GASSMANN-IMHOLZ (normally accessible, EPR-SPID: 761337610916172626), SOARES JESUS (restricted accessible, EPR-SPID 761337618424274719) et Ratchawat (secret: EPR-SPID 761337611340275266)


Publication with   | normal  | restricted  | secret          
------------ | -------------  | ---------------   | ---------------
Gassmann (normally accessible)         | ok  | ok | error
SOARES JESUS (restricted accessible)         | error  | ok | error
Ratchawat (secret)         | error  | error | ok


### metadata in portal

The portal displays the metadata provided in the publication. The patient name is only visible if it is provided in PID-5 in [sourcePatientInfo](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.23). [example](https://test.ahdis.ch/eprik-cara/index.html#/transaction/5c197a2b-c4f3-4da9-bc12-27f9fffe1185)

### provide a document with a technical user (TCU)

Instead of using an authenticated user for publishing documents, the ERP allows to publish documents with a technical user [see factsheet in french](https://www.e-health-suisse.ch/fileadmin/user_upload/Dokumente/2019/F/fiche-dinformation-utilisateur-technique-dep.pdf). You are required to create a client certificate for this technical user and let it register in the HPD. See the [developer platform](https://developer.post.ch/en/e-health/basic-epr-workflows) for exact steps.

EPRIK allows you to work with a specific test technical user during integration. You can get the TCU IdP SAML2 assertion from [here](https://test.ahdis.ch/eprik-cara/camel/tcu). This assertion is valid for 10 minutes. With this assertion you can get then the XUA (STS) token for the XDS requests, for the urn:e-health-suisse:principal-id you need to put the GLN to 2000040030829 when using EPRIK's technical user.

## 6. Providing AuditEvents
Each IHE Transaction has AuditEvent requirements. This is described for each transaction (see example for ITI-45 [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/PIXQuery.md#audit-log) or in [eprik](https://test.ahdis.ch/eprik-cara/index.html#/transaction/0af38ea5-459e-4d05-980d-f6cbdb8af035)). This AuditEvents need to be registered in the community. With [EVSClient](https://ehealthsuisse.ihe-europe.net/EVSClient/atna/validator.seam?standard=ATNA-IHE&extension=IHE) you can validate if the content of the AuditMessages is correct. 