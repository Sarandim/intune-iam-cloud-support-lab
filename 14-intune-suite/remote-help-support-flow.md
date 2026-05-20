## Lab Status

Remote Help was not accessed hands-on during this lab session. The Microsoft Intune Suite licence required for Remote Help is not active in this trial tenant. The RBAC model, consent flow, audit trail, and operational considerations documented below represent architecture and operational reference knowledge consistent with current Microsoft documentation.

## Overview

Remote Help is a Microsoft Intune Suite component that enables IT support engineers to connect to managed Windows devices remotely through a native Microsoft channel, without requiring third-party tools such as TeamViewer or AnyDesk. The connection is authenticated through Entra ID, controlled through Intune RBAC, and every session is fully logged.

## Problem Statement

Enterprise support teams managing remote workers across EMEA require a secure, audited remote access channel that does not depend on third-party software installed on end-user devices. Third-party remote access tools introduce licensing complexity, shadow IT risk, and audit gaps. Remote Help replaces this with a Microsoft-native channel that integrates directly with Intune device management and Entra identity.

## RBAC Model


| Role | Capability | Appropriate Assignment |
|---|---|---|
| Remote Help Administrator | Full control session, view-only session, elevation of the helper to local admin during the session | Senior support engineers handling complex remediation |
| Remote Help Viewer | View-only session, no device interaction | Service desk analysts performing guided user support |

Role assignment is managed in Intune under Tenant administration, Roles. Assignments must follow the principle of least privilege. Full control and elevation capability must be reserved for engineers with a documented operational need.

## Session Consent Flow

1. The support engineer initiates a session request from the Remote Help application.
2. The end user receives a prompt displaying the engineer's name and the session type, view-only or full control.
3. The end user must actively accept the request. The session cannot open without explicit consent.
4. During a full control session the user observes all actions taken by the engineer in real time.
5. Either party can terminate the session at any time.

## Audit Trail

Every Remote Help session generates an audit record in Intune.


| Field | Description |
|---|---|
| Session initiator | UPN of the support engineer who opened the session |
| Target device | Device name and Intune device ID |
| Session type | View only or full control |
| Session start and end time | Timestamps for session duration |
| Elevation used | Whether local admin elevation was invoked during the session |

Session records are accessible under Devices, Remote Help sessions in Intune. For regulated environments, session logs should be exported and retained in line with the applicable audit and data retention policy.

## Prerequisites


| Requirement | Detail |
|---|---|
| Licence | Microsoft Intune Suite or standalone Remote Help add-on |
| Device enrolment | Device must be enrolled in Intune and managed |
| Remote Help application | Installed on both the helper and end-user device |
| Entra ID authentication | Both parties must authenticate with their organisational account |
| Network | Outbound HTTPS on port 443 required from both devices |

## Operational Considerations

Remote Help sessions involving elevation must be initiated only in response to a logged incident or service request. The case number must be recorded in the session notes where the support tooling permits. Unsolicited elevation sessions without a corresponding ticket represent a governance gap and must be flagged in the audit review cycle. Remote Help is not a substitute for Autopilot or device reset workflows where a full device rebuild is required.

## Licensing

Remote Help requires the Microsoft Intune Suite licence or the standalone Remote Help add-on. It is not included in Intune Plan 1, Microsoft 365 Business Standard, or Microsoft 365 E5.
