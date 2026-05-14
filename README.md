# Microsoft Cloud Support Engineer - Entra ID, Intune, Microsoft 365 and Endpoint Security

Hands-on evidence portfolio for Modern Workplace and Cloud Support Engineer roles in EMEA. Built across a 26-day lab sprint in a live Microsoft 365 tenant demonstrating cloud identity, endpoint management, app deployment, endpoint security and ITSM support capability.

---

## Strongest Evidence

- [End-to-end access investigation](10-support-cases/SIGNATURE-case-end-to-end-access-investigation.md) - SharePoint access failure traced across Entra sign-in logs, Conditional Access, device compliance, Intune assignment, licence, group membership and SSO token across eight investigation steps
- [Intune troubleshooting flow](03-intune-enrolment-autopilot/troubleshooting-flow.md) - Live MDM diagnostic methodology including Event Viewer analysis, dsregcmd verification and MDM Diagnostic Report review with real lab screenshots
- [Defender for Endpoint integration](08-defender-endpoint/intune-defender-integration.md) - Intune to Defender connection established, risk-based Conditional Access documented and tested
- [Win32 app packaging](05-intune-apps-win32/win32-packaging.md) - IntuneWinAppUtil used to package and deploy a Win32 app with detection rule configuration and false positive scenario documented
- [Graph PowerShell automation](09-powershell-graph/README.md) - Three live scripts run against the tenant: stale sign-in report, device compliance report and bulk group management

---

## Skills Demonstrated

**Identity and Access**
Microsoft Entra ID, users and groups, MFA, SSPR, RBAC, Conditional Access, hybrid identity awareness, Entra Connect, enterprise app SSO with SAML, SCIM provisioning, sign-in log investigation

**Endpoint Management**
Microsoft Intune, Windows automatic MDM enrolment, Autopilot, compliance policies, configuration profiles, Wi-Fi and VPN profiles, Windows security baseline, update rings, app protection policies for iOS BYOD

**Application Deployment**
Microsoft 365 Apps deployment, store app deployment, Win32 app packaging with IntuneWinAppUtil, detection rule configuration, deployment failure investigation

**Endpoint Security**
Microsoft Defender for Endpoint integration with Intune, risk-based Conditional Access, Windows security baseline, endpoint hardening

**Automation**
Microsoft Graph PowerShell, stale account reporting, device compliance reporting, bulk group management, governance automation

**ITSM**
ITIL incident and service request structure, priority and SLA reasoning, root cause analysis, customer-visible updates, support case documentation across 16 cases plus signature case

---

## Featured Support Cases

**[SIGNATURE - End-to-End Access Investigation](10-support-cases/SIGNATURE-case-end-to-end-access-investigation.md)**
Remote user cannot access SharePoint. Investigated across Entra sign-in logs, Conditional Access evaluation, device compliance state, Intune assignment, licence assignment, group membership and SSO token. Eight-step investigation with tools documented at each stage.

**[Case 009 - Defender Risk Score Blocking Access](10-support-cases/case-009-defender-risk-score-blocking-access.md)**
Active threat detected on managed device by Defender for Endpoint. Risk score elevated above compliance threshold. Device automatically blocked from Conditional Access. Threat investigated and remediated. Compliance restored without manual policy changes.

**[Case 014 - SSO Failing Attribute Mapping Mismatch](10-support-cases/case-014-sso-failing-attribute-mapping-mismatch.md)**
Salesforce SSO failing after successful Entra ID authentication. Investigated through sign-in logs and SAML token content review. Root cause identified as UPN versus primary email mismatch in the Name ID attribute mapping. Resolved by changing source attribute from user.userprincipalname to user.mail.

---

## Support Case Library

16 documented cases plus the signature end-to-end investigation covering Entra ID, Intune, endpoint security, app deployment, hybrid identity, enterprise SSO and Graph automation. Full index at [10-support-cases/INDEX.md](10-support-cases/INDEX.md).

---
## Professional Context

Banking service desk background with hands-on Microsoft cloud administration built through this lab sprint. Certifications held:

- Microsoft Applied Skills: Get started with identities and access using Microsoft Entra
- CompTIA Security+ SY0-701
- Microsoft Azure Administrator AZ-104
- Microsoft Azure Fundamentals AZ-900
- IT Specialist Network Security, Certiport
- PCI DSS 4.0 Compliance
- Cybersecurity Governance, Risk and Compliance
- PRINCE2 Foundation, PeopleCert

Target role family: Modern Workplace Support Engineer, Microsoft 365 Support Engineer, Endpoint Administrator, Identity and Access Support Analyst, Cloud Support Engineer.
