**Case:** 018
**Date:** 19 May 2026
**Reported by:** Alex Turner
**Affected user:** Alex Turner, alex.turner@DalModernWorkplaceLab.onmicrosoft.com
**Affected CI:** win11-hotpatch-lab
**Priority:** P3 - Single user affected, device missing expected security update
**Urgency:** Normal
**Impact:** Single device did not receive the expected monthly security update within the defined deployment window, leaving the device outside the expected patch compliance state.
**Assignment group:** Endpoint Operations

## Summary

The user reported that win11-hotpatch-lab had not received the expected security update within the deployment window defined by the assigned update ring. Investigation identified a policy conflict between two Windows Update ring policies assigned to the same device, preventing the update ring settings from applying correctly.

## Investigation Steps

1. Navigated to intune.microsoft.com, Devices, All devices, selected win11-hotpatch-lab. Confirmed device enrolment status as enrolled, compliance state as compliant, and last sync timestamp.

2. Selected Device configuration from the left menu on the device page. Reviewed all assigned configuration profiles and update ring policies. Identified two update ring policies assigned to the device: Windows Update Ring - Lab and Hotpatch-Ring-Win11-Lab. Both policies configure overlapping settings including quality update deferral period, option to pause Windows updates, and the After1703 update behaviour setting.

3. Clicked into Hotpatch-Ring-Win11-Lab profile settings. Confirmed three settings in Conflict state: After1703, Quality update deferral period, and Option to pause Windows updates. Conflict state indicates Intune cannot determine which policy value to apply, resulting in neither policy applying those settings to the device.

4. Navigated to Devices, Windows, Update rings in Intune. Confirmed Windows Update Ring - Lab was assigned to IT Support Staff group. Confirmed Hotpatch-Ring-Win11-Lab was assigned to Dynamic IT Users group. Confirmed win11-hotpatch-lab was receiving both policies simultaneously due to overlapping group membership.

5. Navigated to entra.microsoft.com, Groups, confirmed group membership of both IT Support Staff and Dynamic IT Users to verify device targeting scope.

6. Ran the following command via Azure Run command on win11-hotpatch-lab to confirm pending update state at the point of investigation:

```powershell
(New-Object -ComObject Microsoft.Update.Session).CreateUpdateSearcher().Search("IsInstalled=0").Updates | Select-Object Title, MsrcSeverity
```

Result confirmed two non-critical platform updates pending. No OS-level security patches outstanding, indicating the conflict affected policy delivery but the device had received prior updates before the conflict was introduced.

## Resolution Steps

1. Navigated to Devices, Windows, Update rings in Intune. Selected Windows Update Ring - Lab.

2. Deleted Windows Update Ring - Lab to remove the conflicting policy. Hotpatch-Ring-Win11-Lab retained as the authoritative update ring for win11-hotpatch-lab.

3. Returned to win11-hotpatch-lab device page in Intune. Clicked Sync to trigger immediate policy re-evaluation.

4. Confirmed Hotpatch-Ring-Win11-Lab conflict state cleared following policy propagation. Device update ring settings applied from single authoritative policy.

## Root Cause

Two Windows Update ring policies were assigned to win11-hotpatch-lab simultaneously through overlapping group membership. When two update ring policies configure the same settings with different values, Intune enters a conflict state and does not apply either policy for the affected settings. This prevented the update ring deferral and delivery settings from taking effect, blocking the expected update delivery cycle.

## Prevention

Each managed device must be a member of exactly one Windows Update ring policy. Group design must ensure update ring targeting groups are mutually exclusive. Before creating a new update ring policy, existing ring assignments for the target device population must be reviewed and conflicts removed. Ring assignment scope should be validated at the design stage using the patching rings and groups matrix documented in patching-rings-and-groups-matrix.md.

## Customer Update

Dear Alex Turner,

The issue affecting your device has been resolved. A configuration conflict between two update policies was identified and corrected. Your device will now receive security updates as scheduled. Please contact the IT support team at your organisation's service desk if the issue recurs or if you have any further concerns.

## Screenshots

- vbs-status-win11-hotpatch-lab.png
<img width="1150" height="438" alt="vbs-status-win11-hotpatch-lab" src="https://github.com/user-attachments/assets/b12b5d76-65dc-4235-9e5d-dfbe28fe6425" />

- win11-hotpatch-lab-enrolled.png

  <img width="1373" height="629" alt="win11-hotpatch-lab-enrolled" src="https://github.com/user-attachments/assets/396d417a-ac5e-47bb-9f22-0853c9c0fbaa" />

- hotpatch-ring-intune.png
  
  <img width="1428" height="551" alt="hotpatch-ring-intune" src="https://github.com/user-attachments/assets/a4534164-8a9f-4f44-a25d-c9740e04893a" />

- hotpatch-profile-intune.png

  <img width="1423" height="637" alt="hotpatch-profile-intune" src="https://github.com/user-attachments/assets/3149fc44-3663-450d-9a96-dcee9d29f997" />
