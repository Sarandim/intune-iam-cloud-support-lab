## Overview

Privileged Identity Management is a Microsoft Entra ID P2 feature that controls who can activate privileged roles in a tenant, under what conditions, and for how long. Instead of permanent role assignments that expose the tenant to risk from compromised accounts, PIM makes users eligible for roles. Eligible users must request activation, provide a justification, complete MFA, and in some configurations wait for an approver to grant access. The role expires automatically at the end of the defined duration. Every step is logged in the PIM audit trail.

This document covers the just-in-time elevation model, approval and MFA requirements, audit trail structure, and break-glass account exclusion as implemented in this lab environment.

## Why This Matters in EMEA Regulated Environments

Permanent privileged role assignments are a critical audit finding in regulated industries across the Netherlands, Belgium, and Germany. Banks, pharmaceutical companies, and manufacturing organisations subject to ISO 27001, NEN 7510, or SOC 2 audits must demonstrate that privileged access is time-limited, justified, approved, and logged. PIM provides the technical control that satisfies these requirements. An engineer who can configure and operate PIM is demonstrably ready to work in a regulated EMEA environment.

## Just-in-Time Elevation Model

| State | Description | Risk Level |
|---|---|---|
| Eligible | User can request the role but does not hold it | Low, no standing access |
| Active | User holds the role for a defined duration | Medium, time-limited standing access |
| Permanent active | User holds the role indefinitely | High, not recommended in regulated environments |

In this lab environment Maria Costa was assigned as eligible for the Security Reader role with an end date of 19 August 2026. She does not hold the role permanently. She must request activation each time she needs it.

## Role Settings Configured

The Security Reader role was configured with the following settings in PIM.

| Setting | Value | Rationale |
|---|---|---|
| Activation maximum duration | 8 hours | Maximum time a single activation can last |
| MFA required on activation | Yes | Confirms the identity of the person requesting elevation |
| Justification required on activation | Yes | Creates a written record of why access was needed |
| Approval required to activate | Yes | Adds a human review gate before access is granted |
| Approver | Sarandim | Named approver responsible for reviewing activation requests |
| Allow permanent eligible assignment | No | Eligible assignments must have an end date |
| Eligible assignments expire after | 1 year | Forces periodic review and renewal of eligibility |
| Allow permanent active assignment | No | Active assignments must have an end date |
| Active assignments expire after | 6 months | Limits duration of any standing active access |
| MFA required on active assignment | Yes | Enforces MFA even for directly assigned active roles |

## Activation Flow

The full just-in-time activation flow was completed in this lab session.

1. Maria Costa navigated to Identity Governance, Privileged Identity Management, My roles in the Entra admin centre while signed in to her account.
2. The Security Reader eligible assignment was visible with the end date of 19 August 2026.
3. Maria Costa clicked Activate, set duration to 1 hour, and entered the justification: Required to review security configuration and compliance posture for IT support investigation. Temporary access requested in line with least privilege policy.
4. The activation request was submitted and routed to Sarandim for approval.
5. Sarandim reviewed the request in PIM, Approve requests, confirmed the justification was appropriate, entered the approver justification, and confirmed the approval.
6. The role was activated for Maria Costa for one hour and the activation was logged in the PIM audit trail.

## Audit Trail

The PIM resource audit log confirmed the following events for this session.

| Timestamp | Actor | Action |
|---|---|---|
| 20/05/2026, 20:40 | Sarandim | Add eligible member to role, timebound, Security Reader, Maria Costa |
| 20/05/2026, 20:51 | Sarandim | Update role setting in PIM, Security Reader |
| 20/05/2026, 21:15 | Maria Costa | Add member to role approval requested, PIM activation, Security Reader |
| 20/05/2026, 21:23 | Sarandim | Add member to role request approved, PIM activation, Security Reader |
| 20/05/2026, 21:23 | Maria Costa | Add member to role completed, PIM activation, Security Reader |

Every action is attributed to the correct identity with a timestamp, providing a complete chain of custody for the elevation event.

## Break-Glass Account Exclusion

Break-glass accounts are emergency administrator accounts held outside normal access controls for use when PIM or MFA is unavailable. In a regulated environment, break-glass accounts must be excluded from PIM eligible assignment requirements and Conditional Access policies that enforce MFA, as these accounts exist specifically for scenarios where normal authentication pathways have failed.

The following design requirements apply to break-glass accounts in a PIM-managed environment.

| Requirement | Detail |
|---|---|
| Account type | Cloud-only account, not synchronised from on-premises |
| MFA | Excluded from MFA Conditional Access policies |
| PIM | Assigned Global Administrator permanently, not via PIM eligibility |
| Monitoring | Sign-in alerts configured for any use of the account |
| Credentials | Stored in a physical vault, not in a password manager |
| Review | Credentials reviewed and rotated every 90 days |

No break-glass account was configured in this lab tenant, the design requirements above represent the enterprise standard for regulated EMEA environments.

## Screenshots

- pim-eligible-assignment-security-reader.png
<img width="1917" height="740" alt="pim-eligible-assignment-security-reader" src="https://github.com/user-attachments/assets/1550f024-c28d-4ee7-84fb-8c758ed73d41" />

  
- pim-role-settings-security-reader.png
<img width="1904" height="1032" alt="pim-role-settings-security-reader" src="https://github.com/user-attachments/assets/feb8b908-a660-4e24-9be8-b90959f38cf4" />


- pim-role-settings-detail-security-reader.png
<img width="1873" height="1075" alt="pim-role-settings-detail-security-reader" src="https://github.com/user-attachments/assets/d7912a6a-3c05-47d0-a93b-720b87087ee2" />

  
- pim-maria-eligible-role.png
<img width="1917" height="812" alt="pim-maria-eligible-role" src="https://github.com/user-attachments/assets/84516217-3fff-483b-9831-28b6e7961aec" />

  
- pim-activation-request-submitted.png

<img width="1903" height="805" alt="pim-access-review-created" src="https://github.com/user-attachments/assets/96d2e97b-a42a-4d24-b658-8f86500c74e9" />

- pim-approval-request-pending.png

<img width="1923" height="1043" alt="pim-approval-request-pending" src="https://github.com/user-attachments/assets/9d8097e7-a7c2-4d44-9c95-453a400a8fcf" />

- pim-approval-confirmed.png
<img width="1959" height="818" alt="pim-approval-confirmed" src="https://github.com/user-attachments/assets/69d29576-d6ec-45b6-837b-3c912cc63d63" />

  
- pim-audit-trail.png
<img width="1923" height="887" alt="pim-audit-trail" src="https://github.com/user-attachments/assets/e18e2d9b-65da-4b84-8d4f-c448982670f6" />

