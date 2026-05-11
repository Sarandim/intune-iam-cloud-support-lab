# Case 004 - SSPR Failure Due to Authentication Method Not Registered

**Type:** Incident
**Priority:** P3 - Single user affected, temporary access available via admin 
password reset
**Impact:** Single user, James Lebron, unable to complete self-service password 
reset
**Urgency:** Normal - access restored via alternative method while root cause 
is investigated
**Affected CI:** User account james.lebron@DalModernWorkplaceLab.onmicrosoft.com
**Assignment group:** IT Support - Identity and Access

## Summary
James Lebron reported being unable to reset a forgotten password using the 
self-service password reset portal. The reset process failed at the identity 
verification step. Investigation confirmed the user had not registered any 
authentication method since account creation, leaving SSPR unable to verify 
identity before allowing a password reset.

## Investigation
1. Confirmed the user account is a member of IT Support Staff group, which 
is within the SSPR scope defined in Entra under Password reset, Properties.
2. Reviewed authentication method registration status in Entra under 
Authentication methods, User registration details. Confirmed zero 
authentication methods registered against the user account.
3. Confirmed SSPR requires one authentication method to be registered before 
a reset can proceed, as configured under Password reset, Authentication methods.
4. Verified the user account was created without being prompted to register 
authentication methods, as the registration enforcement setting requires 
sign-in to trigger the registration prompt. The user had not completed a 
sign-in since account creation.
5. Confirmed no licence gap was present. The user holds a valid Microsoft 
365 Business Standard licence with no restrictions affecting SSPR eligibility.

## Resolution
1. Issued a Temporary Access Pass to the user via Entra under the user 
account, Authentication methods, to enable a controlled sign-in without 
requiring the existing password.
2. Directed the user to sign in using the Temporary Access Pass and complete 
the Microsoft Authenticator registration when prompted.
3. Confirmed successful authentication method registration via User 
registration details in Entra.
4. Verified the user could complete a test SSPR flow successfully after 
registration.

## Customer update
James Lebron your password reset failed because no verification method 
was registered on your account. A Temporary Access Pass has been issued 
to allow you to sign in and complete the setup. Please sign in and follow 
the prompts to register Microsoft Authenticator. Contact IT support if 
you need assistance during this process.

## Root cause and prevention
The user account was created but the authentication method registration 
prompt was never triggered because the user had not completed a sign-in 
since account creation. The SSPR registration enforcement setting requires 
an active sign-in to trigger the prompt. To prevent recurrence, new joiner 
onboarding will include a mandatory first sign-in step to ensure 
authentication method registration is completed before the user requires 
SSPR access.

## Screenshots
sspr-properties.png
<img width="1671" height="345" alt="sspr-properties" src="https://github.com/user-attachments/assets/cbdea623-66ad-4e2a-b400-b90974ce5611" />
