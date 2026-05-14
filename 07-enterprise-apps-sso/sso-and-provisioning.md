# Enterprise App SSO and SCIM Provisioning - Salesforce

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 15 May 2026

---

## Purpose

Enterprise application SSO connects a SaaS application to Microsoft Entra ID as the identity provider. Users authenticate once with their work account and gain access to the application without a separate username and password. Entra ID issues a SAML token that the application trusts, eliminating the need for the application to manage its own credentials.

---

## What Was Configured

Salesforce was added from the Microsoft Entra App Gallery and configured with SAML SSO. Alex Turner was assigned to the application with the Standard User role. The SCIM provisioning configuration screen was accessed and the required credential fields were documented. A live connection test was not completed as no Salesforce subscription is available in this lab.

---

## SAML SSO Configuration

**Location:** Entra admin centre, Enterprise applications, Salesforce, Single sign-on, SAML

### Basic SAML Configuration

| Field | Value |
|---|---|
| Identifier (Entity ID) | https://dalworkplacelab.my.salesforce.com |
| Reply URL (ACS URL) | https://dalworkplacelab.my.salesforce.com/sso/saml |
| Sign on URL | https://dalworkplacelab.my.salesforce.com |

**Note:** In a production deployment these values are taken directly from the Salesforce SSO configuration page in Setup and must match exactly. A mismatch between the Entra configuration and the Salesforce SP metadata is the most common cause of SAML SSO failures.

### How SAML SSO Works

User attempts to access Salesforce, Salesforce redirects to Entra ID login, user authenticates with work credentials, Entra ID generates a SAML token signed with the configured certificate, token sent to the Salesforce Reply URL, Salesforce validates the token and grants access.

The SAML certificate in Entra ID is the trust anchor. Salesforce must be configured to trust the certificate issued by Entra ID. The certificate thumbprint and expiry date are visible in the SAML Certificates section of the app configuration.

### User Assignment

Alex Turner was assigned to the Salesforce application with the Standard User role. Only users assigned to an enterprise application in Entra ID can authenticate to it via SSO. Unassigned users are blocked at the Entra ID layer before the SAML token is issued.

---

## SCIM Provisioning

**Location:** Entra admin centre, Enterprise applications, Salesforce, Provisioning

SCIM (System for Cross-domain Identity Management) automates user account creation and removal in the target application based on Entra ID group membership. When a user is added to the assigned group in Entra ID, SCIM creates their account in Salesforce automatically. When they are removed from the group or their Entra ID account is disabled, SCIM deprovisions their Salesforce account automatically.

### Required Credentials to Connect

The provisioning configuration screen was accessed in the lab. The following credential fields are required to establish a live SCIM connection to Salesforce:

| Field | Purpose |
|---|---|
| Admin username | Salesforce admin account used by Entra ID to create and remove user accounts |
| Admin password | Password for the Salesforce admin account |
| Secret token | Security token generated from Salesforce Setup, used to authenticate API calls |
| Tenant URL | The Salesforce instance URL, for example https://dalworkplacelab.my.salesforce.com |

A live connection test was not completed because no Salesforce subscription is available in this lab. The configuration screen and credential requirements were documented from direct access to the provisioning interface.

### Why SCIM Matters in EMEA Environments

GDPR requires organisations to remove access immediately when an employee leaves. Manual deprovisioning across hundreds of SaaS applications is slow and error-prone. SCIM automates the entire joiner-mover-leaver cycle. A new employee is added to an Entra ID group and their Salesforce account is created automatically. When they leave and their Entra ID account is disabled, their Salesforce access is removed automatically without any manual intervention.

---

## Screenshots

- salesforce-saml-basic-config.png
  <img width="1373" height="980" alt="salesforce-saml-basic-config" src="https://github.com/user-attachments/assets/efb66b64-f6b5-402f-bf92-4222d93cba51" />

- salesforce-saml-certificate.png
  <img width="751" height="377" alt="salesforce-saml-certificate" src="https://github.com/user-attachments/assets/9df675a1-acd8-41fa-8775-cd0a3c21291b" />

- salesforce-user-assignment.png
<img width="1384" height="592" alt="salesforce-user-assignment" src="https://github.com/user-attachments/assets/9106a339-2105-4ccf-8699-6527819acb0c" />

- salesforce-scim-provisioning-config.png
<img width="1914" height="827" alt="salesforce-scim-provisioning-config" src="https://github.com/user-attachments/assets/9e72d64b-0306-4518-b7a2-0c9efe8089bc" />


  
