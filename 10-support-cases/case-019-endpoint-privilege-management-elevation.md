**Title:** Endpoint Privilege Management elevation request for approved finance application
**Case:** 019
**Date:** 20 May 2026
**Reported by:** Alex Turner
**Affected user:** Alex Turner, alex.turner@DalModernWorkplaceLab.onmicrosoft.com
**Affected CI:** win11-hotpatch-lab
**Priority:** P3 - Single user affected, application requires elevation to function correctly.
**Urgency:** Normal
**Impact:** User unable to run an approved finance reporting application that requires elevated privileges to execute. Standard user account does not have local administrator rights on the managed device.
**Assignment group:** Endpoint Operations

## Summary

The user reported that an approved finance reporting application failed to launch with an access denied error on a managed Windows 11 device. The device is enrolled in Intune and configured as a standard user account without local administrator rights. Investigation confirmed the application requires elevation to write to a protected system path during initialisation. An Endpoint Privilege Management elevation rule was designed and documented as the approved resolution architecture. EPM policy creation was not completed in this lab tenant due to the Microsoft Intune Suite licence boundary. The resolution steps below document the approved design for execution in a licensed production tenant following change approval.

## Investigation Steps

1. Navigated to intune.microsoft.com, Devices, All devices, selected win11-hotpatch-lab. Confirmed device enrolment status as enrolled and compliance state as compliant.

2. Reviewed the application error reported by the user. The access denied error at launch indicated the application was attempting to write to a path requiring local administrator privileges during initialisation.

3. Confirmed the application is present on the approved software register. Verified the application publisher certificate and confirmed the executable file hash for the approved version.

4. Navigated to Endpoint Security, Endpoint Privilege Management in Intune. Confirmed the EPM dashboard was accessible and the migration readiness report was live. Confirmed no existing elevation rule covered the reported application.

5. Confirmed the user account does not hold local administrator rights on the device, consistent with the standard user configuration enforced across the managed estate.

6. Documented the elevation requirement and escalated to the change advisory process for EPM rule creation approval.

## Resolution Steps

1. Confirmed the application elevation requirement and verified the publisher certificate and approved file hash with the application owner.

2. Raised a change request for EPM elevation rule creation documenting the application name, publisher certificate, file hash, elevation type, and target device group scope. Change request is pending approval and implementation in a licensed production tenant.

3. Note: EPM policy creation was not completed in this lab tenant due to the Microsoft Intune Suite licence boundary. The following steps represent the approved resolution architecture for execution in a licensed production tenant following change approval.

4. Navigate to intune.microsoft.com, Endpoint Security, Endpoint Privilege Management, Policies. Select Create policy, Windows, Elevation rules policy.

5. Create an elevation rule targeting the application using publisher certificate combined with file hash. Set elevation type to User confirmed, requiring the user to acknowledge and justify the elevation before the process proceeds.

6. Assign the elevation rule policy to the device group containing the affected device. Sync the device to apply the policy.

7. Confirm the user can launch the application with the elevation prompt appearing and confirm the audit record is generated under Reports, Endpoint Privilege Management.

## Root Cause

The finance reporting application requires write access to a protected system path during initialisation, which is not permitted under a standard user account. No EPM elevation rule existed for this application at the time of the incident. The correct resolution is a scoped elevation rule targeting the specific application version using publisher certificate and file hash, with user confirmed elevation type to maintain an auditable record of every elevation event.

## Prevention

All applications requiring elevation must be identified during the application onboarding process and submitted for EPM rule creation before deployment to end-user devices. Application owners are responsible for providing the publisher certificate and approved file hash to the endpoint team as part of the onboarding request. EPM audit reports must be reviewed monthly to identify elevation events occurring outside approved rules.

## Audit Justification

The elevation rule is scoped to a single approved application version identified by publisher certificate and file hash. Elevation type is user confirmed, generating an audit record for every event. The rule targets a device group limited to the population requiring the application. The elevation does not grant permanent local administrator rights.

## Customer Update

Dear Alex Turner,

A change request has been raised to address the access issue affecting your finance application. The investigation confirmed the root cause and the resolution has been approved. Implementation is scheduled following the standard change approval process. The service desk will contact you directly once the configuration has been applied to your device.

## Screenshots

- epm-dashboard-intune.png
  <img width="1900" height="1059" alt="epm-dashboard-intune" src="https://github.com/user-attachments/assets/985aa39b-397b-4be8-bc02-98b500a32f64" />

- epm-rbac-roles-intune.png
<img width="1922" height="698" alt="epm-rbac-roles-intune" src="https://github.com/user-attachments/assets/39d5a5f3-b4ff-4e00-bec0-d7297ecd2312" />
