The EPR Integration Kit is available at [https://test.ahdis.ch/eprik-cara/](https://test.ahdis.ch/eprik-cara/).

<figure markdown>
  ![Image title](img/eprik-transaction.png){ width="600" }
  <figcaption>Transaction List</figcaption>
</figure>
By default it lists all transactions made during the day. You can filter by IHE transaction type or time range.

## Endpoints

That the requests are routed through **EPRIK** the following endpoints need to be configured in your primary system
for EPRIK instead of CARA INT:


Transaction  | EPRIK          | CARA INT
------------ | -------------  | ------------
Host         | test.ahdis.ch  | ws.epr.cara.int.post-ehealth.ch
Port         | 443 (https) or 80 (http)    | 443 (https, clientcert)
XDS [[ITI-18]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html)   |  /eprik-cara/services/iti18Endpoint         | /Registry/services/RegistryService
XDS [[ITI-41]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-41.html)   | /eprik-cara/services/iti41Endpoint         | /Repository/services/RepositoryService
XDS [[ITI-43]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html)   | /eprik-cara/services/iti43Endpoint         | /Repository/services/RepositoryService
XDS MU [[ITI-57]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-57.html)   | /eprik-cara/services/iti57Endpoint         | /Registry/services/RegistryService
XDS RMU [[ITI-92]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-92.html)   | /eprik-cara/services/iti92Endpoint         | /PehpUpdateResponderIti92
XDS-I RAD [[ITI-69]](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol2.pdf)   | /eprik-cara/services/iti69Endpoint         | /Repository/services/RepositoryService
PIX V3 [[ITI-44]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-44.html)   | /eprik-cara/services/iti44Endpoint         | /UPIProxy/services/PIXPDQV3ManagerService
PIX V3 [[ITI-45]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-45.html)   | /eprik-cara/services/iti45Endpoint         | /UPIProxy/services/PIXPDQV3ManagerService
PDQ V3 [[ITI-47]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-47.html)   | /eprik-cara/services/iti47Endpoint         | /UPIProxy/services/PIXPDQV3ManagerService
HPD [[ITI-58]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-58.html)   | /eprik-cara/services/iti58Endpoint         |  /HPD/services/HPDService
HPD [[ITI-59]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-598.html)   | /eprik-cara/services/iti59Endpoint         | /HPD/services/HPDService
CH:PPQ [[PPQ-1]](https://www.bag.admin.ch/dam/bag/de/dokumente/nat-gesundheitsstrategien/strategie-ehealth/gesetzgebung-elektronisches-patientendossier/gesetze/ergaenzung_2.1_anhang_5_epdv_edi_ausgabe_4.pdf.download.pdf/EPDV-EDI_Anhang_5_E2.1_DE_Ausgabe_4.pdf)   | /eprik-cara/services/ppq1Endpoint         |  /services/PR
CH:PPQ [[PPQ-2]](https://www.bag.admin.ch/dam/bag/de/dokumente/nat-gesundheitsstrategien/strategie-ehealth/gesetzgebung-elektronisches-patientendossier/gesetze/ergaenzung_2.1_anhang_5_epdv_edi_ausgabe_4.pdf.download.pdf/EPDV-EDI_Anhang_5_E2.1_DE_Ausgabe_4.pdf)   | /eprik-cara/services/ppq2Endpoint         | /services/PR
XUA [[ITI-40]](https://www.bag.admin.ch/dam/bag/de/dokumente/nat-gesundheitsstrategien/strategie-ehealth/gesetzgebung-elektronisches-patientendossier/gesetze/anhang_5_ergaenzung_1_epdv_edi_ausgabe_4.pdf.download.pdf/EPDV-EDI_Anhang_5_E1_DE_Ausgabe_4.pdf)   | /eprik-cara/services/stsEndpoint         | /EPDSTS/services/SecurityTokenService
ATNA [[ITI-20]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html)   | 34.65.112.202:8080 (unsecured TCP)  | 4.65.239.4:8080 (TLS)

You find an overview of the current relevant specifications and the associated links for the Swiss Electronic Patient Record EPR also [here](https://www.e-health-suisse.ch/en/technik-semantik/epr-projectathon/epr-programming-aids/relevant-specifications.html) and in the [Post E-Health Platform – developer portal](https://developer.post.ch/en/e-health).
