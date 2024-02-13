# CARA Requirements

There are some special requirements on top of the EPR, due to the software used by CARA.

## When publishing a document (ITI-41)

The [DocumentEntry.sourcePatientInfo](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.23) SHALL be
present and convey the patient first and last name in the PID-5 field.
This information is used by the web portal to show the patient name associated with that document.
You can provide the name as found in the MPI.

Other PID fields are optional.

```xml
<Slot name="sourcePatientInfo">
    <ValueList>
        <Value>PID-5|GASSMANN-IMHOLZ^CYRIL RENE FRANCOIS</Value>
    </ValueList>
</Slot>
```

If using the `authorInstitution` attribute, the [HL7 V2.5 XON](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#t4.2.3.1.7-2)
value SHALL contain the organization OID in the XON.10 field.

```xml
<rim:Value>Some Hospital^^^^^^^^^2.999.1.2.3.4.5.6.7.8.9.1789.45</rim:Value>
```
