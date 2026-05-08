# Case 002 - MFA Enrolment Failure

**Type:** Incident
**Priority:** P3 - Single user affected, access retained via existing session
**Impact:** Single user, Maria Costa, MFA enrolment incomplete
**Urgency:** Normal - registration required within 24 hours per security policy
**Affected CI:** User account maria.costa@DalModernWorkplaceLab.onmicrosoft.com
**Assignment group:** IT Support - Identity and Access

## Summary
Maria Costa was unable to complete MFA enrolment after receiving the 
registration prompt on sign-in. The enrolment wizard presented the Microsoft 
Authenticator QR code for scanning but the process could not be completed 
because the Microsoft Authenticator app was not installed on the user's 
mobile device.

## Investigation
1. Reviewed sign-in logs in Entra under Users, Maria Costa, Sign-in logs. 
Logs showed two incomplete registration attempts in the preceding 48 hours, 
confirming the issue was not isolated to a single event.
2. Confirmed Microsoft Authenticator is enabled for all users in the tenant 
Authentication methods policy with no targeting restrictions.
3. Contacted the user via Teams call and confirmed the Microsoft Authenticator 
app had not been installed on the mobile device prior to attempting enrolment.
4. Confirmed a valid Microsoft 365 Business Standard licence is assigned to 
the account with no restrictions affecting MFA registration.
5. Checked Authentication methods, User registration details in Entra and 
confirmed registration status as incomplete, not blocked by policy.

## Resolution
1. Directed the user to install the Microsoft Authenticator app from the 
device app store.
2. Guided the user through the enrolment steps: sign in, select Microsoft 
Authenticator when prompted, scan the QR code displayed on screen, approve 
the number matching notification in the app to confirm setup.
3. Confirmed successful MFA enrolment via User registration details under 
Authentication methods, Monitoring in Entra.

## Customer update
Maria Costa - MFA enrolment failed because the Microsoft Authenticator app 
was not installed on the device before the registration process was started. 
Please install the app from your device app store and sign in again to 
complete registration. Contact IT support if assistance is required.

## Root cause and prevention
MFA enrolment was attempted without the required app installed on the user 
device. The new joiner onboarding guide will be updated to include the 
instruction to install Microsoft Authenticator before attempting MFA 
registration for the first time.
