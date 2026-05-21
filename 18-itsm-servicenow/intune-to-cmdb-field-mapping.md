## Overview

This document maps device and identity data fields from Microsoft Intune and Microsoft Entra ID to the corresponding fields in the ServiceNow Configuration Management Database. In enterprise environments where Intune is integrated with ServiceNow, this mapping enables automatic population and updates of CMDB records from Intune device data, ensuring support engineers have accurate, current device information when investigating incidents without needing to open Intune directly.

The exact CMDB field names depend on the schema version and any extensions or custom fields in use in a given ServiceNow instance. The mapping below uses the standard cmdb_ci_computer and sys_user table fields as the baseline reference.

## Lab Status

A ServiceNow Yokohama personal developer instance was provisioned at dev316120.service-now.com. A CMDB configuration item was created manually for the enrolled MacBook Air using real device data from Intune, demonstrating the field mapping in practice. An incident and a change request were created in the same instance and linked to the CI, demonstrating the end-to-end ServiceNow workflow for a managed device.

## Intune Device Data to ServiceNow CMDB Field Mapping

| Intune Field | Intune Location | ServiceNow CMDB Field | CMDB Table |
|---|---|---|---|
| Device name | Devices, All devices, Overview | Name | cmdb_ci_computer |
| Serial number | Devices, All devices, Overview | Serial number | cmdb_ci_computer |
| Manufacturer | Devices, All devices, Overview | Manufacturer | cmdb_ci_computer |
| Device model | Devices, All devices, Overview | Model ID | cmdb_ci_computer |
| Operating system | Devices, All devices, Overview | Operating System | cmdb_ci_computer |
| OS version | Devices, All devices, Overview | OS Version | cmdb_ci_computer |
| Primary user | Devices, All devices, Overview | Assigned to | cmdb_ci_computer |
| Ownership | Devices, All devices, Overview | Owned by, or a custom ownership field where defined | cmdb_ci_computer |
| Compliance state | Devices, All devices, Device compliance | Compliance, typically a custom or extended field populated by the Intune integration | cmdb_ci_computer |
| Last check-in | Devices, All devices, Overview | Last discovered | cmdb_ci_computer |
| Enrolment date | Devices, All devices, Overview | Install date | cmdb_ci_computer |
| Management type | Devices, All devices, Overview | Managed by, or discovery source field | cmdb_ci_computer |

## Entra ID Data to ServiceNow CMDB Field Mapping

| Entra ID Field | Entra Location | ServiceNow Field | Table |
|---|---|---|---|
| User principal name | Users, All users, Overview | User name | sys_user |
| Display name | Users, All users, Overview | Name | sys_user |
| Department | Users, All users, Properties | Department | sys_user |
| Job title | Users, All users, Properties | Title | sys_user |
| Account enabled state | Users, All users, Overview | Active | sys_user |
| Group membership | Users, All users, Groups | Group member record | sys_user_grmember |
| MFA registration state | Users, All users, Authentication methods | Custom or extended field where defined | sys_user |

## Lab CMDB Record

The following CI was created in the ServiceNow lab instance using real device data from Intune. The Operating System field reflects the value selected from the available options in the developer instance.

| CMDB Field | Value Entered |
|---|---|
| Name | DALs-MacBook-Air |
| Manufacturer | Apple |
| Serial number | Redacted |
| Operating System | Mac OS/X |
| Description | MacBook Air M1 enrolled in Microsoft Intune, managed via MDM with compliance policy, configuration profile, and Microsoft Edge deployed through Intune app deployment |

The Operating System value Mac OS/X was the closest available option in the developer instance dropdown. In a production environment with a current CMDB schema and Intune integration, the value would populate as macOS with the specific version number from the Intune device record.

## ServiceNow Integration in Enterprise Environments

In production environments Intune integrates with ServiceNow through the ServiceNow connector for Microsoft Intune or via Microsoft Graph API calls. Device data is synchronised automatically on a defined schedule, ensuring CMDB records reflect the current Intune state without manual updates. When a device becomes non-compliant in Intune, the CMDB record updates and can trigger automatic incident creation in ServiceNow, routing the ticket to the correct assignment group for investigation.

## Screenshots

- servicenow-developer-instance.png
  <img width="1900" height="1047" alt="servicenow-developer-instance" src="https://github.com/user-attachments/assets/cb8ee114-eeea-4305-9360-fa53989b095a" />

- servicenow-cmdb-ci-macbook-air.png
  <img width="1904" height="1046" alt="servicenow-cmdb-ci-macbook-air" src="https://github.com/user-attachments/assets/56ca362e-a684-48ee-976e-f604021d4f5c" />

- servicenow-incident-created.png
  <img width="1891" height="1070" alt="servicenow-incident-created" src="https://github.com/user-attachments/assets/7ccd309f-1e9b-47f0-b18b-c79a6d17c50a" />

- servicenow-change-request-created.png
  <img width="1915" height="1083" alt="servicenow-change-request-created" src="https://github.com/user-attachments/assets/077da752-b991-4b4e-9c6b-0eec7bef6265" />
