## Lab Status

Endpoint Privilege Management was provisioned and confirmed active in the tenant during this lab session. The EPM migration readiness dashboard was accessed under Endpoint Security, Endpoint Privilege Management, confirming the reporting interface is live and the three elevation categories are visible. Policy creation requires the Microsoft Intune Suite licence or the standalone EPM add-on, which was not available in the trial tenant. The elevation rule design, audit logic, and policy assignment framework documented below represent architecture and operational reference knowledge demonstrated independently of the hands-on licence limitation.

## Overview

Endpoint Privilege Management is a component of the Microsoft Intune Suite that allows specific applications to run with elevated privileges on a standard user account without granting permanent local administrator rights to the device. It replaces the practice of assigning local admin rights broadly across a device population, replacing it with policy-controlled, audited elevation for approved applications and tasks only.

This document covers elevation rule design, policy assignment, and the audit logic required to maintain a defensible record of every elevation event.

## Problem Statement

In managed Windows environments, users frequently require elevated privileges to install approved software, run finance or engineering tools, or execute specific administrative tasks. The traditional response is to grant permanent local administrator rights, which introduces significant security risk across the device estate. EPM removes this requirement by elevating specific processes on demand, under policy control, with a full audit trail.

## Elevation Rule Types

| Rule Type | Description | Use Case |
|---|---|---|
| Automatic elevation | Approved application elevates without user interaction | Trusted internal tools with a known publisher certificate |
| User confirmed elevation | User must confirm the elevation request before it proceeds | Applications requiring occasional elevation where user intent must be recorded |
| Support approved elevation | Elevation requires approval from an IT support administrator before proceeding | High-risk applications or first-time elevation requests outside normal policy scope |

## Elevation Rule Design

Each elevation rule is configured in Intune under Endpoint Security, Endpoint Privilege Management, Policies. A rule targets a specific application using one or more of the following identifiers.

| Identifier | Description |
|---|---|
| File path | Full path to the executable on the device |
| File hash | SHA256 hash of the approved executable version |
| Publisher certificate | Certificate used to sign the application |
| Product name and internal name | Metadata attributes from the application binary |

Using file hash in combination with publisher certificate provides the strongest control, ensuring only the approved version of the application from the approved publisher can be elevated. File path alone is insufficient because it can be exploited by placing a different executable at the same path.

## Policy Assignment

EPM policies are assigned to device groups or user groups in Intune. The recommended assignment model targets device groups aligned to the organisational unit requiring elevation, such as finance devices or engineering workstations, rather than assigning broadly across the estate.

Elevation policies must be scoped to the minimum population required. Assigning an EPM elevation rule to all devices when only a finance team requires elevation creates unnecessary audit surface and increases the risk of unintended elevation events.

## Audit Logic

Every elevation event generates an audit record in Intune regardless of rule type. The audit record contains the following fields.

| Field | Description |
|---|---|
| User principal name | The account that triggered the elevation |
| Device name | The managed device on which the elevation occurred |
| Application name | The elevated process |
| Rule matched | The specific EPM rule that authorised the elevation |
| Elevation type | Automatic, user confirmed, or support approved |
| Timestamp | Date and time of the elevation event |
| Justification | User-provided justification text where rule type requires it |

Audit records are retained in Intune and are accessible under Reports, Endpoint Privilege Management. For regulated environments, audit records should be exported periodically and retained in accordance with the applicable data retention policy.

## Break-Glass Consideration

EPM does not replace break-glass local administrator accounts. A documented break-glass local admin account must remain available on each device for recovery scenarios where Intune policy cannot be applied. The break-glass account must be excluded from EPM scope, documented in the change record, and its credentials stored in a secured vault with access logging.

## Licensing

Endpoint Privilege Management requires the Microsoft Intune Suite licence or the standalone Endpoint Privilege Management add-on. It is not included in Intune Plan 1 or Microsoft 365 Business Standard. Licence eligibility must be confirmed before policy deployment.

## Screenshots

- epm-dashboard-intune.png
<img width="1900" height="1059" alt="epm-dashboard-intune" src="https://github.com/user-attachments/assets/92d298b1-05df-4687-b1d2-cc7dde1f328c" />
