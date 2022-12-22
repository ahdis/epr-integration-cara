The EPR Integration Kit is available at [https://test.ahdis.ch/eprik-cara/](https://test.ahdis.ch/eprik-cara/).

<figure markdown>
  ![Image title](img/eprik-transaction.png){ width="600" }
  <figcaption>Transaction List</figcaption>
</figure>
By default it lists all transactions made during the day. You can filter by IHE transaction type or time range.

## EPR Endpoints

That the requests are routed through **EPRIK** the following endpoints need to be configured in your primary system
for EPRIK instead of CARA INT for an EPR integration:


Transaction  | EPRIK          
------------ | -------------  
Host         | test.ahdis.ch  
Port         | 443 (https) or 80 (http)    
XDS [[ITI-18]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html)   |  /eprik-cara/services/iti18Endpoint
XDS [[ITI-41]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html)   | /eprik-cara/services/iti41Endpoint
XDS [[ITI-43]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html)   | /eprik-cara/services/iti43Endpoint
XDS MU [[ITI-57]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-57.html)   | /eprik-cara/services/iti57Endpoint
XDS RMU [[ITI-92]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-92.html)   | /eprik-cara/services/iti92Endpoint
XDS-I RAD [[ITI-69]](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol2.pdf)   | /eprik-cara/services/iti69Endpoint
PIX V3 [[ITI-44]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-44.html)   | /cara/UPIProxy/services/PIXPDQV3ManagerService
PIX V3 [[ITI-45]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-45.html)   | /cara/UPIProxy/services/PIXPDQV3ManagerService
PDQ V3 [[ITI-47]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-47.html)   | /cara/UPIProxy/services/PIXPDQV3ManagerService
HPD [[ITI-58]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-58.html)   | /eprik-cara/services/iti58Endpoint
HPD [[ITI-59]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-598.html)   | /eprik-cara/services/iti59Endpoint
CH:PPQ [[PPQ-1]](https://www.bag.admin.ch/dam/bag/de/dokumente/nat-gesundheitsstrategien/strategie-ehealth/gesetzgebung-elektronisches-patientendossier/gesetze/ergaenzung_2.1_anhang_5_epdv_edi_ausgabe_4.pdf.download.pdf/EPDV-EDI_Anhang_5_E2.1_DE_Ausgabe_4.pdf)   | /eprik-cara/services/ppq1Endpoint
CH:PPQ [[PPQ-2]](https://www.bag.admin.ch/dam/bag/de/dokumente/nat-gesundheitsstrategien/strategie-ehealth/gesetzgebung-elektronisches-patientendossier/gesetze/ergaenzung_2.1_anhang_5_epdv_edi_ausgabe_4.pdf.download.pdf/EPDV-EDI_Anhang_5_E2.1_DE_Ausgabe_4.pdf)   | /eprik-cara/services/ppq2Endpoint
XUA [[ITI-40]](https://www.bag.admin.ch/dam/bag/de/dokumente/nat-gesundheitsstrategien/strategie-ehealth/gesetzgebung-elektronisches-patientendossier/gesetze/anhang_5_ergaenzung_1_epdv_edi_ausgabe_4.pdf.download.pdf/EPDV-EDI_Anhang_5_E1_DE_Ausgabe_4.pdf)   | /eprik-cara/services/stsEndpoint
TCU SAML2 | /eprik-cara/camel/tcu
ATNA [[ITI-20]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html)   | 34.65.112.202:8080 unsecured TCP according to [RFC5425](https://www.rfc-editor.org/rfc/rfc5425)

You find an overview of the current relevant specifications and the associated links for the Swiss Electronic Patient Record EPR also [here](https://www.e-health-suisse.ch/en/technik-semantik/epr-projectathon/epr-programming-aids/relevant-specifications.html) and in the [Post E-Health Platform – developer portal](https://developer.post.ch/en/e-health).


## transferts (TRA) Endpoints

That the requests are routed through **EPRIK** the following endpoints need to be configured in your primary system
for EPRIK instead of CARA INT for an transferts integration:


Transaction  | EPRIK          
------------ | -------------  
Host         | test.ahdis.ch  
Port         | 443 (https) or 80 (http)    
TRA PIX V3 [[ITI-44]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-44.html)   | /eprik-cara/services/tra/PIXPDQ/services/PIXPDQV3ManagerService
TRA PIX V3 [[ITI-45]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-45.html)   | /eprik-cara/services/tra/PIXPDQ/services/PIXPDQV3ManagerService
TRA HPD [[ITI-58]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-58.html)   | /eprik-cara/services/tra/HPD/services/HPDService/
TRA HPD [[ITI-59]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-598.html)   | /eprik-cara/services/tra/HPD/services/HPDService/
TRA STS [[ITI-40]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-40.html)   |  /eprik-cara/services/tra/b2bsts/SecurityTokenService/
TRA TCU STS | /eprik-cara/camel/tra/2000040030829
TRA [submitDocuments](transferts/wsdl/SourceAdaptorService.wsdl)* | /eprik-cara/services/tra/rcdc/SourceAdaptor/
TRA [GetDocumentList](transferts/wsdl/RecipientCentricDocumentConsumer.wsdl)* | /eprik-cara/services/tra/rcdc/Rcdc/
TRA XDS [[ITI-18]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html)*   |  /eprik-cara/services/tra/Registry/services/RegistryService
TRA XDS [[ITI-41]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html)*   | /eprik-cara/services/tra/Repository/services/RepositoryService

* Webservice call needs STS token