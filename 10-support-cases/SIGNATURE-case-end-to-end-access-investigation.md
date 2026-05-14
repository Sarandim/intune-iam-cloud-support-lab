# SIGNATURE CASE - End-to-End Access Investigation: User Cannot Access SharePoint

**Type:** Incident
**Priority:** P2 - User fully blocked from corporate collaboration platform. Business productivity impact confirmed.
**Impact:** Single user. Alex Turner unable to access SharePoint from intune-test-dev. All SharePoint-dependent workflows blocked.
**Urgency:** High. SharePoint access required for active project work.
**SLA:** Response target 2 hours. Resolution target 4 hours. Case within SLA at time of logging.
**Affected CI:** intune-test-dev | Azure VM | West Europe | Corporate-owned | SharePoint Online
**Assignment group:** Identity and Access Operations

---

## Summary

Alex Turner reported being unable to access SharePoint Online from intune-test-dev. The user was receiving an access denied error after authentication. A systematic end-to-end investigation was conducted covering Entra ID sign-in logs, Conditional Access evaluation, device compliance state, Intune assignment, licence assignment, group membership and SSO token validation. The root cause was identified at the Conditional Access layer where the device compliance state had lapsed due to a check-in delay following the VM being in a stopped state.

---

## Investigation

### Step 1 - Sign-in log reviewed

**Tool:** Entra admin centre, Sign-in logs

Located the failed sign-in for Alex Turner against SharePoint Online. Sign-in status showed Failure. Opened the sign-in event and reviewed the Basic info, Location, Device info and Conditional Access tabs.

Conditional Access tab showed two policies evaluated:

- CA001: applied, result Success
- Require compliant Windows 10/11 devices: applied, result Failure

Failure reason: device not compliant.

This confirmed the block was caused by Conditional Access enforcing device compliance, not an authentication failure or licence issue.

### Step 2 - Conditional Access policy reviewed

**Tool:** Entra admin centre, Conditional Access, Policies

Opened Require compliant Windows 10/11 devices. Confirmed the policy was set to On and targeted SharePoint Online as a resource. Grant control confirmed as Require device to be marked as compliant. Policy configuration was correct. The block was the policy working as designed.

### Step 3 - Device compliance state checked

**Tool:** Intune admin centre, Devices, Windows, intune-test-dev

Device compliance status showed Not compliant. Opened the compliance breakdown and reviewed the per-setting evaluation against Windows 10 Compliance Policy.

All settings showed Compliant except the last check-in timestamp. The device had not checked in within the compliance evaluation window because intune-test-dev had been in a stopped state in Azure. When the VM was restarted it had not yet completed a full check-in cycle to refresh the compliance state.

### Step 4 - Intune assignment verified

**Tool:** Intune admin centre, intune-test-dev, Device configuration

Confirmed all configuration profiles and compliance policies were assigned and showing Succeeded status after the most recent check-in. No assignment gaps identified. The device was correctly in scope for all relevant policies.

### Step 5 - Licence assignment verified

**Tool:** Microsoft 365 admin centre, Users, Alex Turner, Licences and apps

Confirmed Alex Turner had Microsoft 365 Business Standard assigned. SharePoint Online is included in this licence. No licence gap identified.

### Step 6 - Group membership verified

**Tool:** Entra admin centre, Users, Alex Turner, Groups

Confirmed Alex Turner was a member of New Joiners, IT Support Staff and Dynamic IT Users. No missing group membership that would affect SharePoint access.

### Step 7 - SSO token reviewed

**Tool:** Entra admin centre, Sign-in logs, sign-in event, Authentication details tab

Reviewed the token issuance details. The primary refresh token was issued successfully. The Conditional Access evaluation on the token confirmed the device compliance signal was the blocking condition, consistent with findings from Step 1.

### Step 8 - Manual sync triggered

**Tool:** Intune admin centre, intune-test-dev, Sync

Triggered a manual MDM sync from the Intune device record. Monitored the compliance status. After the sync completed the compliance state refreshed to Compliant. The device had met all compliance requirements. The previous non-compliant state was caused solely by a stale check-in timestamp from the VM being stopped.

**Finding:** Alex Turner was blocked from SharePoint by the Require compliant Windows 10/11 devices Conditional Access policy. The device was not genuinely non-compliant. The compliance state had become stale because intune-test-dev had been in a stopped state and had not completed a check-in cycle to refresh the compliance timestamp. A manual sync resolved the stale state and restored access.

---

## Resolution

Manual MDM sync triggered from the Intune admin centre. Device compliance state refreshed to Compliant on completion of the sync cycle. Alex Turner confirmed successful access to SharePoint within 5 minutes of the sync completing. No policy changes were required. The device met all compliance requirements throughout the incident.

---

## Customer Update

Alex Turner,

Your access to SharePoint has been restored. The issue was caused by your device not having checked in with our management system recently, which caused the system to temporarily flag it as unverified. This has been corrected. Your device is confirmed as secure and meeting all requirements. No further action is required from you. Contact the IT support desk if you experience any further access issues.

---

## Root Cause and Prevention

**Root cause:** intune-test-dev had been in a stopped state in Azure. When restarted the device had not yet completed a check-in cycle with Intune to refresh the compliance timestamp. The Conditional Access policy evaluated the stale compliance state and blocked access as a precaution.

**Prevention:** For devices that are regularly stopped and restarted, configure a compliance grace period in the compliance policy to allow a check-in window after device restart before blocking access. For Azure VMs used as managed endpoints, ensure the VM is started with sufficient lead time before the user requires access to allow the check-in cycle to complete. Where users report access blocks after device restart, trigger a manual sync as the first resolution step before investigating deeper.

---

## Tools Used in This Investigation

| Step | Tool | Purpose |
|---|---|---|
| 1 | Entra admin centre, Sign-in logs | Identified CA policy as the block source |
| 2 | Entra admin centre, Conditional Access | Confirmed policy configuration was correct |
| 3 | Intune admin centre, Device compliance | Identified stale compliance timestamp |
| 4 | Intune admin centre, Device configuration | Verified policy assignment scope |
| 5 | Microsoft 365 admin centre, Licences | Ruled out licence gap |
| 6 | Entra admin centre, Group membership | Ruled out missing group membership |
| 7 | Entra admin centre, Sign-in logs, Authentication details | Confirmed token and CA evaluation |
| 8 | Intune admin centre, Device sync | Resolved stale compliance state |

---

## Screenshots

- windows10_compliance_policy_summary.png

  <img width="907" height="870" alt="windows10_compliance_policy_summary" src="https://github.com/user-attachments/assets/fa54ba58-2f56-4a12-b7f5-746189572781" />

- conditional_access_compliant_devices.png

  <img width="1625" height="925" alt="conditional_access_compliant_devices" src="https://github.com/user-attachments/assets/0cbd568e-1416-4abd-87e7-f7cb3e94fcc3" />
