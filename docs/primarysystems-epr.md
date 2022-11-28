For a deep EPR integration into a primary systems the following usecases should be covered

1. Integrate the strong authentication into the primary system with an IdP
2. Search for patients in the community
3. Register a patient from the primary system in the community
4. Query and retrieve documents for a patient from the EPR including authorization
5. Publish documents for a patient by a healthcare professional
   
e-health-suisse has described the different steps with examples [here](https://www.e-health-suisse.ch/fr/technique-semantique/raccordement-dep/techniciens.html). Please find below additional information relevant for CARA and EPRIK.

## 1. Integrate the strong authentication into the primary system with and IdP

Authenticate a user at an identity provider certified for the Swiss EPR. Primary systems need to use this transaction to retrieve a IdP assertion. The IdP assertion is required to retrieve the XUA Assertion to be used with EPR transactions. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/AuthenticateUser.md).

See EPRIK example for [AuthnRequest](https://test.ahdis.ch/eprik-cara/index.html#/transaction/5dc8c8d9-705e-4006-874e-e03ff7c4f434) and [ArtifactResolve](https://test.ahdis.ch/eprik-cara/index.html#/transaction/eabdcf9b38f9fc31c85b33835493db9d55028ca9).

If you have a test user you can [use the IdP Assertion from EPRIK](usecases/#use-the-idp-assertion-from-eprik) until you have done the IdP integration yourself.

## 2. Search for patients in the community

A search for a a patient is done via a demographics query. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/PDQ.md). 

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/e86d22ce-647d-4d1d-a611-6ae2464683ae). This example search is done on the family name, other demographics query parameters are possible. Please note that Swiss Extension requires that an error is returned if more than 5 matched would be returned. You need to provide creationTime, sender OID and receiver OID in addition to the query parameters in the request. For the communication you need a client certificate but with EPRIK a client certificate is not necessary. 


## 3. Register a patient from the primary system in the community and query the patient community id

### Register local patient Id in the community

Register a patient in a community. Primary systems need to use this transaction to register patient data and then to be able to provide and retrieve documents to the patients EPR. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/PIXFeed.md).

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/22915696-7258-4c3f-b223-658deb4a8c88). This example registers the local id from the primary system P001 of the patient identity domain 2.16.756.5.30.1.999.90 in the MPI. You need to provide creationTime, sender OID and receiver OID in addition to the patient parameters (EPR-SPID, MPI-ID) in the request. For the communication you need a client certificate, but with EPRIK a client certificate is not necessary.

### Query 

The primary systems needs to query the master patient ID (MPI-ID) for patients to retrieve or provide documents for, based on the local id registered above. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/PIXQuery.md).

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/73566a45-4696-4a3c-9c6a-f8245ec4be8a).

## 4. Query and retrieve documents for a patient from the EPR

### Query
Retrieve the document metadata for the documents stored in a patients EPR. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/RegistryStoredQuery.md).

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/ab4049f8-ba33-4d84-b9a5-d094ce4117aa). For the Query the MPI-ID of the patient needs to be added. This example requests includes the security token necessary. With the EPRIK you can do the user authentication there and reuse the token [see](usecases/#use-the-idp-assertion-from-eprik). For the communication you need a client certificate but with EPRIK a client certificate is not necessary.

### Authorization

To query and retrieve documents the HCP needs to be authorized based on the IdP token, the patient (resourceID with EPR-SPID), purposeOfUse (NORM, EMER) and role (HCP).
See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/GetXAssertion.md).

EPRIK example [request, response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/b62996b2-da1b-49ba-98f1-e64d7123154e).

Example STS requests with [IdP](requests/sts.http), [EPRIK-httpheader](requests/sts-idp-httpheader.http) or [EPRIK-soapheader](requests/sts-idp-soapheader.http).

### Retrieve

To retrieve documents from a patients EPR the IHE XDS.b profile and transactions needs to be used. See detailed description [here](https://github.com/ehealthsuisse/EPD-by-example/blob/main/files/RetrieveDocumentSet.md).

EPRIK example [request,response](https://test.ahdis.ch/eprik-cara/index.html#/transaction/6a6ee447-a842-44f6-bc29-b8a35d14c5e1). With  EPRIK you can do the user authentication there and reuse the token [see](usecases/#use-the-idp-assertion-from-eprik). For the communication you need a client certificate but with EPRIK a client certificate is not necessary. You will need to add the HomeCommunityId, RepositoryUniqueId and DocumentUniqueId.


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

EPRIK allows you to work with a specific test technical user during integration. You can get the TCU IdP SAML2 assertion from [here](https://test.ahdis.ch/eprik-cara/camel/tcu). This assertion is valid for 10 minutes. With this assertion you can get then the XUA (STS) token for the XDS requests.