### 29.3.2023: Release 5.0.0 on CARA INT

The integration system has been updated to 5.0.0 from 3.7.0 with the following changes:

- STS: endpoint for the Secure Token Service has been changed from 5.0.0 to /EPDSTS/services/SecurityTokenService to /STS/services/SecurityTokenService 
- ITI-41: Document Entry.originalProviderRole needs to be provided [EPDREL 15: Annex 5, E1](https://www.fedlex.admin.ch/filestore/fedlex.data.admin.ch/eli/oce/2022/39/de/pdf-a/fedlex-data-admin-ch-eli-oce-2022-39-de-pdf-a.pdf)
- ITI-45: For a PIX V3 query where the EPR-SPID is requested, the EPRS-PID will be returned in patient/id (before patient/patientPerson/asOtherIDs/id) [EPDREL 16: Annex 5, E1](https://www.fedlex.admin.ch/filestore/fedlex.data.admin.ch/eli/oce/2022/39/de/pdf-a/fedlex-data-admin-ch-eli-oce-2022-39-de-pdf-a.pdf). 