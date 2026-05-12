# Case 006 - Autopilot Profile Not Applied Due to Group Targeting Error

**Type:** Incident
**Priority:** P3 - Single user affected, device provisioned without Autopilot profile
**Impact:** Single user, Alex Turner, device completed OOBE without Autopilot configuration applied
**Urgency:** Normal - device functional but not configured to organisational standard
**Affected CI:** Windows device registered to alex.turner@DalModernWorkplaceLab.onmicrosoft.com
**Assignment group:** IT Support - Endpoint Management

## Summary
Alex Turner reported that a new Windows device powered on and presented 
the default Windows out-of-box experience rather than the customised 
Autopilot setup configured for the organisation, and investigation 
confirmed the deployment profile was assigned to a group that did not 
include the user account.

## Investigation
1. Reviewed the device record in Intune under Devices, Windows devices 
and confirmed the device was enrolled but showed no Autopilot profile 
applied in the device properties.
2. Checked the deployment profile assignment in Intune under Devices, 
Windows, Enrollment, Deployment profiles and confirmed the profile was 
assigned to IT Support Staff group rather than the intended All Devices 
group, with alex.turner@DalModernWorkplaceLab.onmicrosoft.com confirmed 
as a member of New Joiners and not IT Support Staff.

## Resolution
1. Updated the deployment profile assignment in Intune to include All 
Devices group, replacing the incorrect IT Support Staff assignment.
2. Reset the device in Intune using the Autopilot Reset action to 
trigger a fresh OOBE with the corrected profile applied.
3. Confirmed the profile was applied successfully on the next device 
setup by reviewing the device record in Intune, which showed the 
Autopilot profile name under device properties.

## Customer update
Alex Turner - your device completed initial setup without the 
organisation's standard configuration because of a profile assignment 
error, and IT support will initiate a remote reset of your device to 
correct this. When the device restarts and presents the setup screen, 
sign in with your work account and follow the on-screen instructions, 
and contact IT support if you encounter any issues during setup.
