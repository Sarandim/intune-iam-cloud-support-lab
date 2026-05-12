# Intune Troubleshooting Flow - Policy Delivery and Diagnostic Logs

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Device:** intune-test-dev | Azure VM | Windows 10.0.26100.2605 | West Europe
**Date:** 12 May 2026

---

## Where to Look

### 1. Intune Admin Centre - Device Record

`intune.microsoft.com > Devices > Windows > [device name]`

Shows enrolment type, last check-in timestamp and per-profile deployment status. First stop for any policy delivery investigation.

### 2. Event Viewer - MDM Admin and Operational Logs

`Applications and Services Logs > Microsoft > Windows > DeviceManagement-Enterprise-Diagnostics-Provider`

**Admin log** - key events:

| Event ID | Meaning |
|---|---|
| 209 | OMA-DM session completed successfully. MDM channel is healthy. |
| 404 | CSP policy node error. Requires interpretation. See Known Benign Events below. |
| 2900, 2910 | Policy evaluation state transitions. Informational. |

**Operational log** - per-policy processing trace. Use when the Admin log error code alone does not identify the cause.

### 3. MDM Diagnostic Report

`Settings > Accounts > Access work or school > [MDM account] > Info > Create report`

Generates a ZIP archive at `C:\Users\Public\Documents\MDMDiagnostics\MDMDiagReport` containing the HTML policy summary, registry dump, CSP collector traces and event log exports. Use when Event Viewer review is inconclusive or a full policy node audit is required.

### 4. Company Portal - Device Status

`Company Portal app > Home`

Shows the user-facing view of enrolled devices and last sync time. Use for first-contact triage to confirm whether the device is recognised as managed before escalating to Event Viewer or the diagnostic report.

---

## Decision Tree - Device Enrolled, Policies Not Applying

**Symptom:** Device visible in Intune. Configuration profiles show Pending or Not applicable.

**Step 1 - Distinguish the status**

Pending: the profile is assigned and the device is in scope. Intune is waiting for the next check-in cycle to process the policy. Trigger a manual sync and proceed to Step 3.

Not applicable: the device does not satisfy the profile applicability rule. Common causes are OS edition filter, device type filter or group membership. Proceed to Step 2.

**Step 2 - Review group assignment**

Check which group the profile targets. Confirm whether the device (device-targeted profile) or the enrolled user (user-targeted profile) is a member of that group.

- Device or user is not a member of the target group: add to the group, trigger a manual sync and monitor for a Succeeded status.
- Group membership confirmed: proceed to Step 3.

**Step 3 - Trigger manual check-in**

On the device: `Settings > Accounts > Access work or school > [MDM account] > Info > Sync`

In the Intune admin centre: open the device record and select Sync. Allow 5 to 10 minutes and refresh the profile status.

- Profile status moves to Succeeded: issue resolved. Document the finding.
- Profile remains Pending or shows Error: proceed to Step 4.

**Step 4 - Event Viewer review**

Path: `Applications and Services Logs > Microsoft > Windows > DeviceManagement-Enterprise-Diagnostics-Provider > Admin`

- Event 209 present with no errors: the OMA-DM channel is healthy. Re-check group assignment and applicability rules from Step 2.
- Event 404 with FakePolicy in the CSP path: known benign artefact. See Known Benign Events below. This event does not indicate a policy delivery failure.
- Event 404 with a real policy name in the CSP path and error code 0x80070002: ERROR_FILE_NOT_FOUND at the registry layer. The policy CSP node is not supported on this OS build. Check the Microsoft policy support matrix for the Windows version installed on the device.

**Step 5 - MDM Diagnostic Report**

Generate the report from `Settings > Accounts > Access work or school > [MDM account] > Info > Create report`. Review MDMDiagReport.html for policy node state.

- Policy node absent: the profile never reached the device. Return to Step 2 and verify assignment scope.
- Policy node present with a Failed status: CSP-layer failure. Note the error code and CSP path for further investigation.
- Policy node present with an Applied status: the profile succeeded. Reload the device record in the Intune admin centre.

---

## Known Benign Log Events

### Event 404 - FakePolicy ADMX Artefact

**CSP path:** `./Device/Vendor/MSFT/Policy/ConfigOperations/ADMXInstall/Receiver/Properties/Policy/FakePolicy/Version`
**Error code:** 0x80070002 (ERROR_FILE_NOT_FOUND)

Generated when Intune attempts to register an ADMX-backed policy stub and the corresponding ADMX file is not present on the device. The name FakePolicy in the path confirms this is a placeholder registration, not a real policy failure. No action required.

If Event 404 appears with a real policy name in the CSP path, that is a genuine failure requiring investigation.

---

## Check-in Timing Reference

| Scenario | Frequency |
|---|---|
| Recently enrolled Windows device | Every 3 minutes for the first 30 minutes |
| Established device | Every 8 hours |
| After manual sync | Immediate, then resumes schedule |
| After admin-triggered policy change | Intune notifies the device via push. Timing varies. Manual sync recommended. |

Source: Microsoft Learn - Troubleshoot policies and profiles in Microsoft Intune.

---

## Screenshots

- dsregcmd-status.png
- event-viewer-mdm-admin.png
- event-viewer-mdm-error.png
- mdm-diagnostics-export.png
- company-portal-device.png

<img width="1960" height="1146" alt="event-viewer-mdm-admin" src="https://github.com/user-attachments/assets/8aa26ee2-858f-4c55-8f03-33969abdefd5" />
<img width="1097" height="1097" alt="event-viewer-mdm-error" src="https://github.com/user-attachments/assets/03a8c4dd-3e8d-4afe-87ab-19e776a4c02d" />
<img width="1102" height="1119" alt="dsregcmd-status" src="https://github.com/user-attachments/assets/010036e6-1e6e-437b-8fb5-0c071bd90334" />
<img width="1152" height="1152" alt="mdm-diagnostics-export" src="https://github.com/user-attachments/assets/ccc3d1c3-9b1a-4e7a-9ef4-49bf8243608e" />
<img width="1169" height="644" alt="company-portal-device" src="https://github.com/user-attachments/assets/622e5724-6fc5-4456-9a2f-85b0b9fbf826" />
