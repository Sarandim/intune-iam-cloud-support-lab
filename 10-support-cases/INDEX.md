# Support Cases Index

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Last updated:** 14 May 2026

---

## Purpose

This index lists all support cases documented in this portfolio. Each case follows the ITIL incident and service request structure covering Priority, Impact, Urgency, SLA, Investigation, Resolution, Customer Update and Root Cause and Prevention. Cases are drawn from real lab activity in the DalModernWorkplaceLab tenant and documented realistic scenarios grounded in the configured environment.

---

## Signature Case

**SIGNATURE - End-to-End Access Investigation: User Cannot Access SharePoint**
The primary portfolio evidence case. Traces a SharePoint access failure through eight investigation steps covering Entra ID sign-in logs, Conditional Access evaluation, device compliance state, Intune assignment, licence assignment, group membership, SSO token review and manual sync resolution. Demonstrates end-to-end support reasoning across the full Microsoft cloud stack.

---

## Cases

| Case | Title | Type | Domain | One-line Summary |
|---|---|---|---|---|
| 001 | New Joiner M365 Licence and Group Membership | Service Request | Microsoft 365 | New joiner provisioned with M365 licence and added to correct security groups. |
| 002 | MFA Enrolment Failure | Incident | Entra ID | User unable to complete MFA enrolment traced to unsupported method or licence gap. |
| 003 | User Blocked by Conditional Access | Incident | Entra ID | Legitimate user blocked by CA policy traced through sign-in logs and resolved. |
| 004 | SSPR Lockout | Incident | Entra ID | User locked out of SSPR due to authentication method requirements not met. |
| 005 | Enrolment Failure Outside MDM Scope | Incident | Intune | Device enrolment failed because user was outside the MDM scope group. |
| 006 | Autopilot Profile Not Applied | Incident | Intune | Autopilot profile not applied to device due to group targeting error. |
| 007 | Device Enrolled Profiles Not Applying | Incident | Intune | Device enrolled in Intune but configuration profiles showing Pending due to group assignment gap. |
| 008 | Device Non-Compliant Blocking Access | Incident | Intune / Entra ID | Device flagged non-compliant for missing BitLocker, blocking Conditional Access to corporate resources. |
| 009 | Defender Risk Score Elevated Blocking Access | Incident | Defender / Entra ID | Device risk score elevated by Defender, automatically blocked from Conditional Access until remediated. |
| 010 | VPN Profile Not Deploying Certificate Prerequisite | Incident | Intune | VPN profile assigned but not deploying due to missing certificate infrastructure. Interim fix applied. |
| 011 | M365 Apps Deployment Failing Conflicting Office | Incident | Intune | M365 Apps deployment failing due to pre-existing Office installation preventing automatic removal. |
| 012 | Win32 Deployment Succeeded App Not Present | Incident | Intune | Win32 app reporting Installed in Intune but absent from device due to false positive detection rule. |
| 013 | Corporate Email Blocked App Protection | Incident | Intune | Outlook on personal iOS device blocked by app protection policy due to jailbroken device detection. |
| 014 | SSO Failing Attribute Mapping Mismatch | Incident | Entra ID | Salesforce SSO failing after successful Entra authentication due to SAML Name ID attribute mismatch. |
| 015 | On-Premises Password Not Reflecting in Cloud | Incident | Hybrid Identity | On-premises AD password change not reflected in Entra ID due to Entra Connect sync failure. |
| 016 | Identifying Inactive Accounts Governance Review | Service Request | Entra ID / Graph | Graph PowerShell script identified James Lebron account with no sign-in activity, flagged for governance review. |

---

## Featured Cases for README

Three cases selected for the README Featured support cases section based on breadth and demonstrability:

**Signature case:** End-to-end access investigation across Entra sign-in logs, Conditional Access, device compliance, Intune assignment, licensing, group membership and SSO token.

**Case 009:** Defender risk score elevated, device automatically blocked from Conditional Access until remediated. Demonstrates the Defender to Intune to Conditional Access security chain.

**Case 014:** SSO failing for a user due to SAML attribute mapping mismatch. Demonstrates enterprise identity investigation and resolution.
