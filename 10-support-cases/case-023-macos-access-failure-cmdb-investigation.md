**Title:** macOS device access failure investigated via Intune device record and ServiceNow CMDB
**Case:** 023
**Ticket number:** INC0010001
**Date:** 21 May 2026
**Reported by:** Sarandim Silva
**Affected user:** Sarandim Silva, sarandim@DalModernWorkplaceLab.onmicrosoft.com
**Affected CI:** DALs-MacBook-Air
**CMDB record:** cmdb_ci_computer, DALs-MacBook-Air, ServiceNow instance dev316120
**Priority:** P3 - Single user affected, access to corporate resources blocked from macOS device.
**Urgency:** Normal
**Impact:** User unable to access corporate resources from a managed macOS device. Only the device serial number was available at the point of initial report.
**Assignment group:** Endpoint Operations
**Change record reference:** CHG created for macOS-Compliance-Baseline-Lab policy deployment

## Summary

A user reported inability to access corporate resources from a MacBook Air, the initial report contained only the device serial number. The serial number was used to locate the device record in the ServiceNow CMDB, which provided the device name, OS version, compliance state, last check-in time, ownership type, and assigned policies without requiring direct access to Intune at the point of triage. Full investigation was completed in Intune using the device record identified through the CMDB lookup.

## Investigation Steps

1. Received incident report with device serial number as the only identifying information. Opened ServiceNow, navigated to the CMDB Computers table, searched by serial number, and located the CI record for DALs-MacBook-Air. Confirmed device name, manufacturer Apple, operating system macOS, OS version 26.5, and assigned user from the CMDB record.

2. Using the device name from the CMDB record, navigated to intune.microsoft.com, Devices, All devices, and located DALs-MacBook-Air. Confirmed enrolment status as enrolled, ownership as Personal, and primary user as Sarandim.

3. Reviewed compliance state in Intune, confirmed device showed Compliant against the macOS-Compliance-Baseline-Lab policy following the compliance evaluation and remediation cycle. Confirmed the Default Device Compliance Policy also showed Compliant.

4. Reviewed Device configuration in Intune, confirmed macOS-Configuration-Baseline-Lab profile showed Succeeded, indicating firewall and system integrity settings had been applied correctly.

5. Reviewed Managed Apps in Intune,confirmed Microsoft Edge for macOS showed Installation status as Installed with Resolved intent of Required install, confirming the corporate browser deployment was in place.

6. Reviewed last check-in time, confirmed device last checked in at 21/05/2026, 08:54, indicating active management communication between the device and Intune.

7. Reviewed Entra sign-in logs for the affected user under Identity, Monitoring and health, Sign-in logs. Confirmed no Conditional Access block was active against the device at the time of investigation.

8. Identified that the access failure reported by the user occurred during the initial compliance policy enforcement window, when the device was first evaluated against the macOS-Compliance-Baseline-Lab policy and a password reset was required. Once the password was reset and the compliance evaluation completed, device status updated to Compliant and access was restored.

## Resolution Steps

1. Confirmed device compliance state as Compliant in Intune following the compliance evaluation cycle.

2. Confirmed no active Conditional Access block in Entra sign-in logs.

3. Advised the user that access had been restored following the compliance evaluation and password reset triggered by the newly applied compliance policy.

4. Updated the ServiceNow incident INC0010001 with the resolution note and confirmed the CI record for DALs-MacBook-Air reflected the current compliant device state.

5. Referenced change record for the macOS-Compliance-Baseline-Lab policy deployment as the planned change that triggered the compliance evaluation cycle.

## Root Cause

The access failure occurred during the initial compliance evaluation cycle following deployment of the macOS-Compliance-Baseline-Lab compliance policy to the device. The policy enforced a minimum password complexity requirement that triggered a mandatory password reset on the device. During the password reset process the device was temporarily in a non-compliant state, which blocked access to corporate resources via Conditional Access. Once the password was reset and the compliance evaluation completed successfully, the device was marked Compliant and access was restored automatically.

## Prevention

When deploying new compliance policies to a device population, a grace period should be configured in the Actions for noncompliance settings to allow users time to remediate compliance failures before access is blocked. For macOS password policy enforcement, users should be notified in advance of the compliance policy deployment so they are aware that a password reset may be required and can complete it before the enforcement window begins.

## Customer Update

Dear Sarandim Silva,

The access issue affecting your MacBook Air has been resolved, a new compliance policy was applied to your device which required a password update. Your device is now compliant and access to corporate resources has been restored. Please contact the service desk if you experience any further access issues.

## Screenshots

- macbook-air-intune-device-overview.png
  <img width="1888" height="847" alt="macbook-air-intune-device-overview" src="https://github.com/user-attachments/assets/3ca6c3af-afe6-444e-ac12-59bab33c1f65" />

- macbook-air-compliance-status.png
  <img width="1905" height="738" alt="macbook-air-compliance-status" src="https://github.com/user-attachments/assets/be9ca171-bd49-41cc-8337-e6b7970be144" />

- servicenow-cmdb-ci-macbook-air.png
  <img width="1904" height="1046" alt="servicenow-cmdb-ci-macbook-air" src="https://github.com/user-attachments/assets/bf7f45ad-da3c-4978-bc92-20dbfc4d0f12" />

- servicenow-incident-created.png
  <img width="1891" height="1070" alt="servicenow-incident-created" src="https://github.com/user-attachments/assets/2e011049-e27c-4fbf-abc4-0b9c51565659" />
