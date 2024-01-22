
## Version 1.2.4 - 22/01/2024

- Improved performance of the frontend.
- Improved the transaction validation display.
- Updated the IDP icons.
- Fixed an issue where the validation would not be run anymore.

## Version 1.2.3 - 29/11/2023

- Implemented line numbering in highlighted codes.
- Clients are now sorted by prefix in the list.
- Validators don't stop anymore at the first error.
- Added message for known issues with validators (IPF and EVSClient).

## Version 1.2.2 - 24/11/2023

- Fixed message content processing, where binary data in multipart messages would be corrupted.
- Minor frontend improvements.

## Version 1.2.1 - 23/11/2023

- Fixed error message in MTOM validation.
- Improved error messages in ATNA validation.
- Added pagination to results.
- Only showing runtime status if error, or request and response statuses in the transaction list.
- When clicking the status in the transaction list (e.g. "response" or "runtime"), the right tab will open.
- Increased effort to match audit messages to their client.

## Version 1.2.0 - 22/11/2023

- A changelog is now published.
- Frontend redesign:
    - The code editor has been replaced with a simpler syntax highlighter, that should be lighter for the browser; the
      native search function is not high-jacked anymore.
    - The search API now returns fewer data, making the response smaller.
    - There is now a minimal screen width needed for proper display.
- The ITI-81 response validator is disabled because the CARA INT response still is at FHIR R3 version.
- The EVSClient validator of STS transactions has been fixed.
- The ITI-41 and ITI-43 requests are checked for valid MTOM use.
- The ITI-41 requests are checked for valid XOP use.
- The ATNA audit message validation has been improved.
- The client deletion has been fixed.
- The recipient is now filled on ATNA audit messages.
