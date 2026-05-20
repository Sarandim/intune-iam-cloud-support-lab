## Lab Status

Endpoint Privilege Management was provisioned and confirmed active in this tenant. The EPM migration readiness dashboard was accessed under Endpoint Security, Endpoint Privilege Management, confirming the reporting interface is live and the three elevation categories are visible. The Endpoint Privilege Manager built-in role was assigned to the IT Support Staff group scoped to all devices, establishing the RBAC governance layer for EPM policy management in the lab environment. EPM policy creation requires the Microsoft Intune Suite licence, which was not available in this trial tenant. The elevation rule design, audit logic, and policy assignment framework documented below represent architecture and operational reference knowledge demonstrated independently of the licence limitation.

## Overview

Endpoint Privilege Management is a Microsoft Intune feature that allows specific applications to run with elevated privileges on a standard user account without granting permanent local administrator rights to the device. It replaces the practice of assigning broad local admin rights across a device population with policy-controlled, audited elevation for approved applications only.

## Problem Statement

In managed Windows environments, users frequently require elevated privileges to run finance or engineering tools, install approved software, or execute specific administrative tasks. Granting permanent local administrator rights introduces significant security and audit risk across the device estate. EPM removes this requirement by elevating specific processes on demand, under policy control, with a full audit trail retained in Intune.

## Elevation Rule Types

| Rule Type | Description | Use Case |
|---|---|---|
| Automatic elevation | Approved application elevates without user interaction | Trusted internal tools with a known publisher certificate |
| User confirmed elevation | User must confirm the elevation request before it proceeds | Applications requiring occasional elevation where user intent must be recorded |
| Support approved elevation | Elevation requires IT administrator approval before proceeding | High-risk applications or first-time elevation requests outside normal policy scope |

## Elevation Rule Design

Each elevation rule targets a specific application using one or more of the following identifiers.

| Identifier | Description |
|---|---|
| File path | Full path to the executable on the device |
| File hash | SHA256 hash of the approved executable version |
| Publisher certificate | Certificate used to sign the application |
| Product name and internal name | Metadata attributes from the application binary |

File hash combined with publisher certificate provides the strongest control, ensuring only the approved version from the approved publisher can be elevated. File path alone is insufficient because a different executable placed at the same path could be elevated unintentionally.

## RBAC Model

| Role | Capability |
|---|---|
| Endpoint Privilege Manager | Create, edit, and delete EPM policies in Intune |
| Endpoint Privilege Reader | View EPM policies in Intune, no edit capability |

In this lab environment the Endpoint Privilege Manager role was assigned to the IT Support Staff group scoped to all devices, confirming the RBAC governance layer is configured and active.

## Policy Assignment

EPM policies are assigned to device groups or user groups in Intune. The recommended model targets device groups aligned to the organisational unit requiring elevation, such as finance devices or engineering workstations, rather than assigning broadly across the estate. Assigning an EPM elevation rule to all devices when only a finance team requires elevation creates unnecessary audit surface and increases the risk of unintended elevation events.

## Audit Logic

Every elevation event generates an audit record in Intune regardless of rule type.

| Field | Description |
|---|---|
| User principal name | The account that triggered the elevation |
| Device name | The managed device on which the elevation occurred |
| Application name | The elevated process |
| Rule matched | The specific EPM rule that authorised the elevation |
| Elevation type | Automatic, user confirmed, or support approved |
| Timestamp | Date and time of the elevation event |
| Justification | User-provided justification text where rule type requires it |

Audit records are accessible under Reports, Endpoint Privilege Management in Intune. For regulated environments, audit records should be exported periodically and retained in accordance with the applicable data retention policy.

## Break-Glass Consideration

EPM does not replace break-glass local administrator accounts. A documented break-glass account must remain available on each device for recovery scenarios where Intune policy cannot be applied. Break-glass credentials must be stored in a secured vault with access logging and excluded from EPM scope, with the exclusion documented in the change record.

## Licensing

Endpoint Privilege Management requires the Microsoft Intune Suite licence or the standalone EPM add-on. It is not included in Intune Plan 1, Microsoft 365 Business Standard, or Microsoft 365 E5.

## Screenshots

- epm-dashboard-intune.png
<img width="1900" height="1059" alt="epm-dashboard-intune" src="https://github.com/user-attachments/assets/92d298b1-05df-4687-b1d2-cc7dde1f328c" />

- epm-rbac-roles-intune.png
  <img width="1922" height="698" alt="epm-rbac-roles-intune" src="https://github.com/user-attachments/assets/d0b67405-7452-4efb-9ea9-bc05e0803f4b" />
