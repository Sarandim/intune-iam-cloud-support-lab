**Priority:** P3 - Single user affected, device unmanaged.
**Urgency:** Normal
**Impact:** Analyst unable to access corporate resources due to device compliance enforcement state.
**Affected CI:** user-sarandim-account
**Assignment group:** IT Support - Identity and Access

## Summary
An incident was logged when an analyst could not authenticate to corporate cloud applications from an unmanaged asset, resulting in a systemic access denial enforced by Conditional Access policies.

## Investigation
1. Checked Microsoft Entra sign-in logs for user sarandim@://onmicrosoft.com within the Monitoring & health blade.
2. Isolated a failed sign-in record showing error code 53003, confirming a direct block by Conditional Access policy CA002.
3. Utilised Security Copilot to perform an automated health summary of the device account record intune-test-device.
4. Security Copilot generated a summary stating that the endpoint was flagged non-compliant due to a missing BitLocker encryption profile.
5. Commenced manual human verification of the system-generated output by navigating to the Microsoft Intune admin center at ://microsoft.com.
6. Selected Devices > All devices > intune-test-device and reviewed the Device compliance tab.
7. Discovered that the compliance failure was not caused by BitLocker as stated by the AI assistant, but was instead due to an operating system version falling below the minimum allowed baseline specified in the system policies.
8. Verified the local device state by checking local registry keys, confirming that BitLocker encryption was fully operational on the hardware but the operating system lacked the latest security update ring.

## Resolution
1. Opened the Microsoft Intune admin center and assigned the targeted endpoint to the broad deployment update ring.
2. Instructed the user to access the local settings on the device and select Accounts > Access work or school to initiate a manual management synchronization.
3. Confirmed the device status updated to compliant within the Intune asset registry following successful policy evaluation.
4. Monitored the Microsoft Entra sign-in logs to confirm that subsequent authentication attempts from the user completed successfully with a status score of success.

## Customer Update
**Priority:** P3 - Single user affected, device unmanaged.
**Urgency:** Normal
**Impact:** User unable to access corporate resources due to device compliance enforcement state.
**Affected CI:** alex-turner-workstation
**Assignment group:** IT Support - Identity and Access

## Summary
An incident was logged when an end user could not authenticate to corporate cloud applications from an unmanaged asset, resulting in a systemic access denial enforced by Conditional Access policies.

## Investigation
1. Checked Microsoft Entra sign-in logs for user alex.turner@DalModernWorkplaceLab.onmicrosoft.com within the Monitoring & health blade.
2. Isolated a failed sign-in record showing error code 53003, confirming a direct block by Conditional Access policy CA002.
3. Utilised Security Copilot to perform an automated health summary of the device account record intune-test-device.
4. Security Copilot generated a summary stating that the endpoint was flagged non-compliant due to a missing BitLocker encryption profile.
5. Commenced manual human verification of the system-generated output by navigating to the Microsoft Intune admin center at ://microsoft.com.
6. Selected Devices > All devices > intune-test-device and reviewed the Device compliance tab.
7. Discovered that the compliance failure was not caused by BitLocker as stated by the AI assistant, but was instead due to an operating system version falling below the minimum allowed baseline specified in the system policies.
8. Verified the local device state by checking local registry keys, confirming that BitLocker encryption was fully operational on the hardware but the operating system lacked the latest security update ring.

## Resolution
1. Opened the Microsoft Intune admin center and assigned the targeted endpoint to the broad deployment update ring.
2. Instructed the user to access the local settings on the device and select Accounts > Access work or school to initiate a manual management synchronization.
3. Confirmed the device status updated to compliant within the Intune asset registry following successful policy evaluation.
4. Monitored the Microsoft Entra sign-in logs to confirm that subsequent authentication attempts from the user completed successfully with a status score of success.

## Customer Update
Alex Turner, your access has been restored following a policy synchronization on your workstation. Please restart your device to allow the operating system baseline updates to settle, and contact the service desk via the portal if further authentication blocks occur.

## Root Cause and Prevention
The incident was caused by an outdated operating system version on the managed endpoint, which triggered a non-compliant state under active device posture controls. The AI assistant misidentified the specific setting failure due to a cached evaluation state, proving that manual administrative verification of administrative logs remains a requirement before closing identity incidents. Future configuration drift will be mitigated by the upcoming transition to Windows Autopatch rings.
 your access has been restored following a policy synchronization on your workstation. Please restart your device to allow the operating system baseline updates to settle, and contact the service desk via the portal if further authentication blocks occur.

## Root Cause and Prevention
The incident was caused by an outdated operating system version on the managed endpoint, which triggered a non-compliant state under active device posture controls. The AI assistant misidentified the specific setting failure due to a cached evaluation state, proving that manual administrative verification of administrative logs remains a requirement before closing identity incidents. Future configuration drift will be mitigated by the upcoming transition to Windows Autopatch rings.
