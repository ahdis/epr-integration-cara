# EPR Integration for CARA

This documentation describes how the EPR Integration Kit can be used to test
the integration of a primary system with the [CARA](https://www.cara.ch/) integration system. 

The Integration Kit (short **EPRIK**) provides the following functionality:

- Authenticate an User and obtain an IdP assertion
- Proxy and log IHE transactions without client certificates and with basic validation of request / response 

<figure markdown>
  ![Image title](img/eprik-architecture.png){ width="499" }
  <figcaption>Integration architecture</figcaption>
</figure>

This allows a primary system to do a stepwise integration with the EPR. The integration kit is only
an add-on during development, testing and is not used with a production environment.

!!! danger

    Use only test data and no real patient data! EPRIK is completely open 
    and every request / response to the integration system made is retrievable.
