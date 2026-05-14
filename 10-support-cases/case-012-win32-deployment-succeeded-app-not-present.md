# Case 012 - Win32 Deployment Shows Succeeded But App Not Present on Device

**Type:** Incident
**Priority:** P3 - Single device affected. Application not available to user despite Intune reporting successful deployment.
**Impact:** Single user. Win32 app shows Installed in Intune admin centre but the application is not present on the device.
**Urgency:** Medium. User cannot access the application. No security impact confirmed.
**SLA:** Response target 4 hours. Resolution target 8 hours. Case within SLA at time of logging.
**Affected CI:** intune-test-dev | Azure VM | West Europe | Corporate-owned
**Assignment group:** Endpoint Operations

---

## Summary

Alex Turner reported that a Win32 application assigned through Intune is not available on the device. The Intune admin centre shows the deployment status as Installed for intune-test-dev. Investigation confirmed the detection rule was evaluating a file path that existed on the device independently of the application installation, causing Intune to report a false positive deployment success.

---

## Investigation

**Step 1 - Deployment status reviewed**

Navigated to Intune admin centre, Apps, All apps, Lab Win32 App - Install Script. Selected Device install status. intune-test-dev showed a status of Installed. The status timestamp confirmed the evaluation occurred after the last device check-in.

**Step 2 - Device state verified**

Confirmed with the user that the application was not present on the device. Used Azure Run command to check for the presence of `C:\install.log` on intune-test-dev. The file was present but had been created by a previous manual test rather than by the Intune-deployed install script. Intune evaluated the file as present and marked the deployment as Installed without verifying that the installation had actually run through the assigned deployment.

**Step 3 - Detection rule reviewed**

Opened the app configuration in Intune and reviewed the detection rule. The rule was configured to check for the existence of `C:\install.log`. This file existence check passes whenever the file is present regardless of how it was created, making it insufficient as a reliable installation indicator.

**Step 4 - Root cause confirmed**

The detection rule was not specific enough. A file existence check without verifying file content, version or creation timestamp can produce false positive results if the target file exists on the device for any reason other than the application installation.

**Finding:** The detection rule evaluated a file that existed on the device independently of the Win32 deployment. Intune correctly followed the detection logic and reported Installed. The logic itself was insufficient to confirm genuine application installation.

---

## Resolution

Detection rule identified as the root cause. Recommended fix is to replace the file existence check with a registry key detection rule. The install script should be updated to write a unique registry entry on successful completion, for example `HKLM\Software\DalModernWorkplaceLab\LabApp` with a value of `1`. The detection rule should then check for this registry key rather than a file that could exist independently. This change ensures Intune only marks the app as Installed when the install script has actually run successfully on the device.

Pending the updated package, the affected device was identified as the only device impacted. No further devices showed the same false positive state.

---

## Customer Update

Alex Turner,

The application was showing as installed in our management system but was not actually present on your device. This was caused by an error in how the system was checking for the application. The detection logic is being corrected and the application will be redeployed. You will be notified when it is available on your device. Contact the IT support desk if you have any questions in the meantime.

---

## Root Cause and Prevention

**Root cause:** The Win32 detection rule used a file existence check for a file that was present on the device independently of the application installation. Intune evaluated the detection rule as true and reported a false positive Installed status.

**Prevention:** Detection rules must be specific to the application installation. Best practice is to use registry key detection where the install script writes a unique key on successful completion, or to use file version detection rather than file existence alone. Test detection rules on a clean device before deploying to production groups.

---

## Screenshots

- win32-app-packaging-lab.png
  <img width="1808" height="916" alt="win32-app-packaging-lab" src="https://github.com/user-attachments/assets/1b6f43cd-ccfc-4ddd-9012-e67ee67bc7e9" />
