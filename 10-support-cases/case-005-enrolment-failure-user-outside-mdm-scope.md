# Case 005 - Intune Enrolment Failure Due to User Outside MDM Scope

**Type:** Incident
**Priority:** P3 - Single user affected, device unmanaged
**Impact:** Single user, Alex Turner, unable to enrol device into Intune
**Urgency:** Normal - device access available but non-compliant with 
device management policy
**Affected CI:** User account alex.turner@DalModernWorkplaceLab.onmicrosoft.com
**Assignment group:** IT Support - Endpoint Management

## Summary
Alex Turner reported that after joining a Windows device to the 
organisation's Entra ID tenant, the device did not appear in Intune 
and no management policies were applied. Investigation confirmed the 
MDM user scope under automatic enrolment was scoped to a specific group 
and the user account was not a member of that group, preventing automatic 
Intune enrolment following Entra join.

## Investigation
1. Reviewed device status in Intune under Devices, Windows devices. 
The device was absent from the list, confirming enrolment had not 
completed.
2. Confirmed the device was successfully joined to Entra ID by checking 
Entra admin centre under Devices, All devices, where the device appeared 
with a joined status.
3. Reviewed automatic enrolment configuration in Intune under Devices, 
Windows, Enrollment. MDM user scope was set to Some, with a named group 
assigned. Confirmed alex.turner@DalModernWorkplaceLab.onmicrosoft.com 
was not a member of that group.
4. Confirmed no device platform restriction was blocking Windows MDM 
enrolment by reviewing the default restriction policy under Devices, 
Windows, Enrollment, Device platform restrictions.
5. Confirmed a valid Microsoft 365 Business Standard licence with Intune 
Plan 1 is assigned to the account, ruling out a licence gap.

## Resolution
1. Added the user account to the MDM scope group in Entra admin centre 
under Groups.
2. Directed the user to go to Settings, Accounts, Access work or school 
on the device, click the connected work account and select Disconnect, 
then reconnect by selecting Connect and joining the device to Entra ID 
again to trigger a fresh automatic enrolment.
3. Confirmed the device appeared in Intune under Devices, Windows devices 
with Managed by Intune status and Corporate ownership.
4. Confirmed compliance state updated to Compliant following successful 
enrolment.

## Customer update
Alex Turner - your device was not enrolled into management because your 
account was not included in the enrolment scope at the time of device 
setup. This has been resolved. On your device go to Settings, then 
Accounts, then Access work or school. Click your connected work account 
and select Disconnect. Then select Connect and follow the steps to 
rejoin your work account. Contact IT support if the device does not 
appear managed after reconnecting.

## Root cause and prevention
MDM user scope was configured to target a specific group and the user 
account was not added to that group before device enrolment was 
attempted. MDM scope membership will be added to the new joiner 
onboarding checklist to ensure users are in scope before device 
enrolment is initiated.

## Screenshots
- intune-enrolment-success.png
<img width="1913" height="728" alt=" intune-enrolment-success" src="https://github.com/user-attachments/assets/0f2ff234-6a12-4d78-9ba5-821bffc7cbbc" />
