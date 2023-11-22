
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
