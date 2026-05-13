# Case 010 - VPN Profile Not Deploying Due to Certificate Prerequisite

**Type:** Incident
**Priority:** P3 - Single user affected. Remote access unavailable from managed device. User able to work via alternative means.
**Impact:** Single user. Corporate VPN profile assigned to device but not deploying due to a missing certificate prerequisite.
**Urgency:** Medium. User cannot connect to internal resources remotely. No data loss or security breach confirmed.
**SLA:** Response target 4 hours. Resolution target 8 hours. Case within SLA at time of logging.
**Affected CI:** intune-test-dev | Azure VM | West Europe | Corporate-owned
**Assignment group:** Endpoint Operations

---

## Summary

Alex Turner reported that the VPN connection configured by IT is not appearing on the device. Investigation confirmed the Corporate VPN Profile was assigned to the device through Intune but the connection type originally configured required EAP XML or machine certificates for authentication. Neither prerequisite was available in the tenant at the time of deployment, preventing the profile from applying successfully.

---

## Investigation

**Step 1 - Profile assignment confirmed**

Navigated to Intune admin centre, Devices, Configuration, Corporate VPN Profile - Lab. Assignment confirmed as All Devices with Active status. The profile was in scope for intune-test-dev.

**Step 2 - Profile deployment status reviewed**

Opened the device record for intune-test-dev and selected Device configuration. The VPN profile showed a deployment error. The error indicated the authentication method configured in the profile required a certificate that was not present on the device.

**Step 3 - Certificate prerequisite identified**

Reviewed the VPN profile configuration settings. The connection type originally selected was IKEv2, which requires either EAP XML generated from an existing VPN connection or a machine certificate deployed from a PKI infrastructure. No certificate profiles had been deployed to the tenant at this stage and no EAP XML was available.

**Step 4 - Root cause confirmed**

The profile could not apply because the authentication prerequisite was not met. Windows VPN profiles using IKEv2 or Automatic connection types validate the presence of the required certificate or EAP configuration before establishing the connection profile on the device. Without the certificate the profile deployment fails silently from the user perspective.

**Finding:** The VPN profile was correctly assigned and reached the device but could not apply because the required certificate infrastructure was not in place. This is a configuration sequencing issue, not a profile or assignment error.

---

## Resolution

Connection type changed to Pulse Secure with username and password authentication as an interim measure to restore VPN access while the certificate infrastructure is built. Profile re-deployed to intune-test-dev. VPN connection confirmed visible on the device after the next check-in cycle.

Long-term resolution requires deploying a trusted root certificate profile and a SCEP or PKCS certificate profile to devices before the IKEv2 VPN profile is re-enabled. Certificate deployment is planned as a follow-on configuration task.

---

## Customer Update

Alex Turner,

The VPN connection on your device was not available because a security certificate required by the VPN configuration was not yet in place. An interim VPN configuration has been deployed to restore your remote access. You will be notified when the full certificate-based VPN is ready. Contact the IT support desk if you have any further issues connecting.

---

## Root Cause and Prevention

**Root cause:** The VPN profile was configured with a connection type that requires certificate-based or EAP authentication. The certificate infrastructure was not deployed before the VPN profile was assigned to devices, causing the profile to fail at the authentication validation step.

**Prevention:** When deploying VPN profiles that require certificate authentication, deploy the trusted root certificate profile and the device or user certificate profile to the same target groups before or at the same time as the VPN profile. Verify certificate deployment status in Intune before assigning the VPN profile to production devices.

---

## Screenshots

- vpn-profile-corporate.png

  <img width="1918" height="1058" alt="vpn-profile-corporate png" src="https://github.com/user-attachments/assets/4b826e92-bd16-4a17-989b-77dfeb0a4b75" />
