# PowerShell and Microsoft Graph Scripts

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 17 May 2026

---

## Purpose

These scripts demonstrate operational automation using Microsoft Graph PowerShell. Each script connects to the tenant via delegated access and queries or modifies data through the Microsoft Graph API. The scripts replace manual portal operations with repeatable, auditable automation suitable for governance reporting and bulk administration tasks.

---

## Prerequisites

PowerShell 7.x and the Microsoft Graph PowerShell SDK must be installed.

Install the SDK:

`Install-Module Microsoft.Graph -Scope CurrentUser`

Connect to the tenant before running any script:

`Connect-MgGraph -Scopes "User.Read.All","AuditLog.Read.All","DeviceManagementManagedDevices.Read.All","Group.ReadWrite.All"`

---

## Scripts

### Get-StaleUsers.ps1

Lists all users in the tenant sorted by last sign-in date. Users with no LastSignIn value have never authenticated. Use for governance reviews to identify inactive or orphaned accounts.

**Required scope:** User.Read.All, AuditLog.Read.All

### Get-DeviceComplianceState.ps1

Lists all Intune-managed devices with compliance state, assigned user and operating system. Use to identify non-compliant devices for security reviews without opening the Intune portal.

**Required scope:** DeviceManagementManagedDevices.Read.All

### Add-UsersToGroup.ps1

Adds a user to a group by display name. Extend by replacing the single user lookup with a CSV import loop for bulk onboarding operations. If the user is already a member the API returns an existing membership message, which is expected behaviour.

**Required scope:** Group.ReadWrite.All

---

## Lab Findings

| Script | Finding |
|---|---|
| Get-StaleUsers.ps1 | James Lebron has never signed in. Account flagged for governance review. |
| Get-DeviceComplianceState.ps1 | intune-test-dev confirmed compliant. One managed device in tenant. |
| Add-UsersToGroup.ps1 | James Lebron already a member of IT Support Staff. API confirmed existing membership. |

---

## Screenshots

- script-01-stale-signin-report.png
<img width="824" height="262" alt="script-01-stale-signin-report" src="https://github.com/user-attachments/assets/4436d3b3-b566-441a-8d79-4316ee435efb" />

- script-02-device-compliance-report.png
<img width="938" height="178" alt="script-02-device-compliance-report" src="https://github.com/user-attachments/assets/eaf8f7f1-602e-4aed-9af5-91970ae37f3b" />

- script-03-bulk-group-add.png
<img width="939" height="162" alt="script-03-bulk-group-add png" src="https://github.com/user-attachments/assets/8cc79459-958f-42a8-91a3-12099d3cc181" />

  
