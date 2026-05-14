# Case 015 - On-Premises Password Change Not Reflecting in Cloud

**Type:** Incident  
**Priority:** P3 - Single user affected. Cloud service authentication failing after on-premises password change.  
**Impact:** Single user. Alex Turner changed their on-premises Active Directory password but cannot sign into Microsoft 365 with the new password.  
**Urgency:** High. User is locked out of Microsoft 365 and cannot work until resolved.  
**SLA:** Response target 2 hours. Resolution target 4 hours. Case within SLA at time of logging.  
**Affected CI:** Entra Connect sync | On-premises Active Directory | Microsoft Entra ID  
**Assignment group:** Identity and Access Operations  

---

## Summary

Alex Turner reported being unable to sign into Microsoft 365 after changing their on-premises Active Directory password. The old password no longer works and the new password is being rejected by Entra ID. Investigation confirmed the Entra Connect synchronisation cycle had not completed successfully, preventing the updated password hash from being written to Entra ID.

---

## Investigation

### Step 1 - Authentication method confirmed

Confirmed the tenant is configured for Password Hash Synchronisation. This means Entra ID authenticates users against a synchronised password hash rather than passing requests to on-premises AD. A failed sync means Entra ID still holds the old password hash.

### Step 2 - Entra Connect sync status checked

On the Entra Connect server, opened Synchronisation Service Manager. Reviewed the run history for the most recent sync cycles. The last successful full sync was over 24 hours ago. The most recent delta sync had failed with an export error, indicating objects were not being written to Entra ID.

### Step 3 - Sync error identified

Opened the failed sync run and reviewed the export errors. The error indicated a connector space issue preventing the password hash update from being exported to Entra ID. The user object for Alex Turner was in a pending export state.

### Step 4 - Manual sync triggered

Opened PowerShell on the Entra Connect server and ran `Start-ADSyncSyncCycle -PolicyType Delta`. Monitored the sync cycle in Synchronisation Service Manager. The delta sync completed successfully. The password hash for Alex Turner was exported to Entra ID.

**Finding:** The Entra Connect delta sync cycle had been failing due to a connector space export error. The updated password hash from the on-premises AD password change was queued but not exported to Entra ID, causing authentication to fail with the new password.

---

## Resolution

Manual delta sync triggered on the Entra Connect server resolved the export queue. Alex Turner confirmed successful sign-in to Microsoft 365 with the new password within 5 minutes of the sync completing. Reviewed the root cause of the recurring sync failure and identified a stale connector space object as the underlying issue. Removed the stale object and confirmed subsequent sync cycles completed without errors.

---

## Customer Update

Alex Turner,

Your Microsoft 365 access has been restored. The issue was caused by a delay in the system that synchronises your password between our internal network and the cloud. The synchronisation has now completed and your new password is working. Contact the IT support desk immediately if you experience any further sign-in issues.

---

## Root Cause and Prevention

**Root cause:** A stale connector space object in Entra Connect was causing delta sync export failures. The password hash update from the on-premises AD password change was queued but not written to Entra ID, causing authentication to fail with the new password.

**Prevention:** Configure Entra Connect sync alerts to notify the identity team when sync cycles fail. Monitor the Synchronisation Service Manager run history daily in environments where hybrid identity is in use. Set up Entra ID Connect Health for automated sync failure alerting and reporting.

---

## Screenshots

None. Entra Connect is not available in this lab environment. This case documents a realistic support scenario based on Microsoft Learn documentation for hybrid identity environments.
