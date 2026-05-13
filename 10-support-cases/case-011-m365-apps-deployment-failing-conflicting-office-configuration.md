# Case 011 - Microsoft 365 Apps Deployment Failing Due to Conflicting Office Configuration

**Type:** Incident
**Priority:** P3 - Multiple users affected. Microsoft 365 Apps not installing on targeted devices.
**Impact:** Multiple users. M365 Apps deployment shows failed status in Intune for devices with a pre-existing Office installation.
**Urgency:** Medium. Users can access Microsoft 365 web apps as an interim measure. Desktop app functionality unavailable.
**SLA:** Response target 4 hours. Resolution target 8 hours. Case within SLA at time of logging.
**Affected CI:** Windows 10 and later devices | Corporate-owned | Assigned to All Devices group
**Assignment group:** Endpoint Operations

**Note:** This case documents a realistic deployment failure scenario based on known Intune behaviour. The M365 Apps deployment in this lab completed successfully as no prior Office installation existed on the enrolled device.

---

## Summary

Microsoft 365 Apps deployment was assigned to All Devices through Intune. Devices without a prior Office installation completed the deployment successfully. Devices with an existing Office installation, such as Office 2019 or a volume-licensed Office 2016, reported a failed deployment status. Investigation confirmed the conflict between the existing installation and the Intune-managed M365 Apps suite.

---

## Investigation

**Step 1 - Deployment status reviewed**

Navigated to Intune admin centre, Apps, All apps, Microsoft 365 Apps for Windows 10 and later, Device install status. Identified devices showing a Failed status alongside devices showing Installed. The failure pattern correlated with devices that had been in use before Intune enrolment.

**Step 2 - Error code identified**

Opened the failed device records and reviewed the installation error codes. Error 0x643 was present on affected devices, indicating a Windows Installer failure. This error commonly occurs when a conflicting Office installation is detected during the M365 Apps deployment.

**Step 3 - Device state confirmed**

Connected to an affected device remotely and confirmed a pre-existing Office 2019 installation was present. The M365 Apps deployment profile had Remove other versions set to Yes, but the removal process failed because the existing installation had been customised with additional registry entries that blocked the automated uninstall.

**Step 4 - Intune Management Extension log reviewed**

Navigated to `C:\ProgramData\Microsoft\IntuneManagementExtension\Logs` on the affected device and opened the most recent AgentExecutor log. Confirmed the Office removal step returned a non-zero exit code before the M365 Apps installation was attempted.

**Finding:** The existing Office installation could not be removed automatically due to customised registry entries blocking the uninstall process. The M365 Apps deployment failed at the removal step before installation began.

---

## Resolution

Ran the Microsoft Support and Recovery Assistant on affected devices to perform a clean removal of the existing Office installation. After the removal completed, triggered a manual Intune sync. The M365 Apps deployment retried and completed successfully on the next check-in cycle.

---

## Customer Update

Your device was unable to install the new Microsoft 365 Apps because an older version of Office was present and could not be removed automatically. The IT support team has resolved this remotely. Microsoft 365 Apps is now installed on your device. No further action is required from you. Contact the IT support desk if you notice any issues with the Office applications.

---

## Root Cause and Prevention

**Root cause:** A pre-existing Office installation with customised registry entries blocked the automated removal process required before M365 Apps could be installed. The Intune deployment profile correctly attempted to remove the prior version but the removal failed silently, causing the overall deployment to fail.

**Prevention:** Before deploying M365 Apps to devices that were in use before Intune enrolment, run a device inventory to identify existing Office installations. Where pre-existing installations are found, use the Microsoft Support and Recovery Assistant or a custom Win32 app to perform a clean removal before the M365 Apps profile is assigned. Alternatively, create a separate device group for pre-enrolled devices and stage the deployment with a removal script as a dependency.

---

## Screenshots

- m365-apps-deployment.png

<img width="1909" height="1055" alt="m365-apps-deployment" src="https://github.com/user-attachments/assets/9ba2934e-5564-4f43-b3b8-70d66ff929d7" />


