# CARA Requirements

There are some special requirements on top of the EPR, due to the software used by CARA.

## When publishing a document

The [DocumentEntry.sourcePatientInfo](https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2.3.2.23) SHALL be 
present and convey the patient first and last name in the PID-5 field.
This information is used by the web portal to show the patient name associated with that document.
You can provide the name as found in the MPI.
