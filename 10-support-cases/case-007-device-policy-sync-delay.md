# Case 007 - Device Enrolled, Configuration Profiles Not Applying
**Type:** Incident
**Priority:** P3 - Single device affected, device unmanaged.
**Urgency:** Normal
**Impact:** Single user, configuration profiles showing pending status on a newly enrolled machine.
**Affected CI:** intune-test-device
**Assignment group:** Endpoint Operations

## Summary
The cloud-managed endpoint `intune-test-device` completed Windows automatic enrolment successfully and appears in the administration portal. However, assigned configuration profiles showed a status of Pending rather than Succeeded, which indicated that the required security policies were not verifiably in place on the machine.

## Investigation
1. Navigated to Devices, Windows, and selected intune-test-device in the Intune admin centre to confirm that the enrolment type shows as Windows Automatic MDM with management authority set to Intune, noting that the profile status was stuck on Pending.
2. Reviewed the device record and assignment settings to discover that the target configuration profiles were assigned to a group that intune-test-device was not a member of at the time of enrolment, placing the machine outside the required policy scope.
3. Performed a manual synchronisation cycle on the device by navigating to Settings, Accounts, Access work or school, clicking the connected account, and choosing Info then Sync, which resulted in the profile status remaining Pending due to the group assignment gap.
4. Analysed the Event Viewer on the machine under Applications and Services Logs, Microsoft, Windows, DeviceManagement-Enterprise-Diagnostic-Provider, Admin. Event ID 209 confirmed that the OMA-DM session completed successfully, while Event ID 404 noted an error with CSP path `./Device/Vendor/MSFT/Policy/.../FakePolicy/Version` with error code `0x80070002` which is an expected ADMX registration artefact and not the cause of the failure.
5. Executed `dsregcmd /status` from an elevated Command Prompt to verify the cloud identity state:

| Field | Value | Meaning |
|---|---|---|
| **AzureAdJoined** | YES | Device correctly joined to Entra ID |
| **DomainJoined** | NO | Cloud-only, no on-premises Active Directory |
| **MdmUrl** | microsoft.com | Correct Intune MDM endpoint registered |
| **DeviceAuthStatus** | SUCCESS | Device certificate authentication working |
| **TpmProtected** | NO | Expected on an Azure VM; no physical TPM module |
6. Generated an MDM Diagnostic Report from the device accounts menu, discovering that the policy nodes for the affected configuration profiles were completely absent from the output HTML file, which confirmed that the profiles never reached the operating system due to the assignment error.

## Resolution
1. Added intune-test-device to the correct target security group within the Entra admin centre.
2. Triggered a manual MDM sync from the Intune admin centre device record to force an immediate check-in.
3. Verified that the profile status changed from Pending to Succeeded upon the next successful connection cycle.

## Customer update
Alex Turner: your device is now receiving the configuration policies assigned to it. The delay was caused by a missing group assignment at the time of enrolment. No further action is required. Please contact IT support if you notice any further issues.

## Root cause and prevention
Configuration profiles were assigned to a specific device group that the endpoint did not belong to at the time of enrolment. For manual enrolments, group membership must be verified before closing the task. Moving forward, using dynamic device groups based on the enrollmentProfileName or deviceOwnership attribute will automate this process and prevent manual assignment errors.

## Screenshots
* `event viewer mdm admin`
* `event viewer mdm error`
* `dsregcmd status`
* `mdm diagnostics export`

<img width="1960" height="1146" alt="event-viewer-mdm-admin" src="https://github.com/user-attachments/assets/e5d17884-cb57-47fb-a746-068d6f8fc8e6" />
<img width="1097" height="1097" alt="event-viewer-mdm-error" src="https://github.com/user-attachments/assets/5f8176b9-969c-4ac9-83a8-537ef1e9810a" />
<img width="1102" height="1119" alt="dsregcmd-status" src="https://github.com/user-attachments/assets/e4540c7f-bc39-4379-b454-b5c55894dbbe" />
<img width="1152" height="1152" alt="mdm-diagnostics-export" src="https://github.com/user-attachments/assets/cff66acf-8a25-47e0-a9b1-8808c69b42aa" />

