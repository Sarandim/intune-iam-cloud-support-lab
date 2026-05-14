# Case 014 - SSO Failing for User Due to Attribute Mapping Mismatch

**Type:** Incident
**Priority:** P3 - Single user affected. SSO authentication to Salesforce failing at login.
**Impact:** Single user. Alex Turner unable to authenticate to Salesforce via SSO. Error presented at the Salesforce login page after successful Entra ID authentication.
**Urgency:** Medium. User cannot access Salesforce. Work tasks requiring CRM access are blocked.
**SLA:** Response target 4 hours. Resolution target 8 hours. Case within SLA at time of logging.
**Affected CI:** Salesforce enterprise application | Entra ID SSO configuration
**Assignment group:** Identity and Access Operations

---

## Summary

Alex Turner reported being unable to sign into Salesforce using their work account. The user successfully authenticates to Entra ID but receives an error at the Salesforce login page after the redirect. Investigation confirmed the SAML token issued by Entra ID contained a user identifier attribute that did not match the format expected by Salesforce, causing the SSO authentication to fail at the attribute mapping layer.

---

## Investigation

**Step 1 - Sign-in log reviewed**

Navigated to Entra admin centre, Sign-in logs, located the failed sign-in for Alex Turner against the Salesforce application. The sign-in showed Interrupted status with error code 50105. This error indicates the user was authenticated by Entra ID but the application rejected the SAML assertion.

**Step 2 - SAML token content reviewed**

In Entra admin centre, Enterprise applications, Salesforce, Single sign-on, opened the Test single sign-on section. Reviewed the SAML token attributes sent to Salesforce. The Unique User Identifier claim was configured to send `user.userprincipalname` which for Alex Turner resolved to `alex.turner@dalmodernworkplacelab.onmicrosoft.com`.

**Step 3 - Salesforce expected attribute identified**

Reviewed Salesforce SSO configuration requirements. Salesforce expects the SAML Name ID to match the FederationIdentifier field on the Salesforce user record, which is the user's primary email address without the onmicrosoft.com subdomain.

**Step 4 - Attribute mapping mismatch confirmed**

The Entra ID SAML configuration was sending the UPN which included the onmicrosoft.com domain suffix. Salesforce was expecting the primary email address without that suffix. The two values did not match, causing Salesforce to reject the SAML assertion.

**Finding:** The SAML Name ID attribute sent by Entra ID did not match the FederationIdentifier value on the Salesforce user record. The mismatch prevented Salesforce from correlating the incoming SAML assertion to an existing user account.

---

## Resolution

Navigated to Entra admin centre, Enterprise applications, Salesforce, Single sign-on, Attributes and Claims. Edited the Unique User Identifier claim and changed the source attribute from `user.userprincipalname` to `user.mail`. The user.mail attribute resolves to the primary email address without the onmicrosoft.com suffix, matching the FederationIdentifier value in Salesforce.

Tested the updated configuration using the Test single sign-on function in Entra admin centre. SAML token confirmed sending the correct email address format. Alex Turner retested authentication and SSO completed successfully.

---

## Customer Update

Alex Turner,

Your access to Salesforce via single sign-on has been restored. The issue was caused by a mismatch between the identifier your account was sending during login and what Salesforce was expecting. This has been corrected in the configuration. You can now sign into Salesforce using your normal work account credentials. Contact the IT support desk if you experience any further issues.

---

## Root Cause and Prevention

**Root cause:** The SAML Name ID attribute in the Entra ID SSO configuration was set to user.userprincipalname, which included the onmicrosoft.com domain suffix. Salesforce expected the primary email address format without that suffix. The mismatch caused Salesforce to reject the SAML assertion.

**Prevention:** When configuring SAML SSO for a new application, verify the expected Name ID format from the application's SSO documentation before configuring the attribute mapping in Entra ID. Test the SSO configuration using a pilot user before assigning the application to all users. Use the Test single sign-on function in Entra admin centre to inspect the SAML token content and confirm the attributes match the application requirements.

---

## Screenshots

- salesforce-saml-basic-config.png

<img width="1373" height="980" alt="salesforce-saml-basic-config" src="https://github.com/user-attachments/assets/dd408d64-4a27-40fc-b722-46d5f4c16a2a" />
