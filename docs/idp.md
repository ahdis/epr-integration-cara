Important notes to use IdP SAML2 assertions with EPRIK 

## HIN ID

1. you need to have a GLN assigned to the HIN user that, otherwise the STS [ITI-40] will not work since the NameID is not known
2. the test HIN ID expires after six months

## TRUST ID

1. if you authenticate with trust ID and eprik you have to provide the SAML2 NameID to be configured
2. you can get test trust id [here](https://register-int.trustid.ch/trustid)