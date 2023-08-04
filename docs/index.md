# Primary system integration with CARA

!!! note

    29.3.2023: Release 5.0.0 on CARA INT: The EPR CARA integration version is newer than the production version, see [changelog](changelog.md) for differences.

This documentation describes how the Integration Kit can be used to test
the integration of a primary system with the [CARA](https://www.cara.ch/) integration system.

CARA offers different services:

- EPR [https://epr.cara.int.post-ehealth.ch](https://epr.cara.int.post-ehealth.ch)
- Transferts [https://b2b.cara.int.post-ehealth.ch/](https://b2b.cara.int.post-ehealth.ch/).
- PMP (eMedication Service) [https://cara-ch.github.io/emed-service-guide/](https://cara-ch.github.io/emed-service-guide/)

To access the integration system you will need to sign a contract/CGUE with [CARA](https://www.cara.ch/) and provide an OID concept for your organization,
in return you will get:

- an HCP test user for which you need an online authentication yourself (e.g. HIN ID) and connect that HCP test user with your online authentication
- two test patients
- access to the [Post E-Health Platform – developer portal](https://developer.post.ch/en/e-health) for the EPR integration.

This will allow you to start the integration of the primary system.

The Integration Kit (short **EPRIK**) provides the following [functionality](usecases.md):

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

### Configuration

| Parameter            | Integration                         | Production                  |
|----------------------|-------------------------------------|-----------------------------|
| MPI OID              | 2.16.756.5.30.1.191.1.0.2.1         | 2.16.756.5.30.1.191.3.0.2.1 |
| Repository unique ID | 2.16.756.5.30.1.191.1.0.12.1.101.31 |                             |
