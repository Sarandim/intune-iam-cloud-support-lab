# Case 009 - Defender Risk Score Elevated, Device Blocked from Conditional Access

**Type:** Incident
**Priority:** P2 - Active security threat confirmed on a managed corporate device. Single user blocked from all corporate resources. Elevated from P3 due to confirmed endpoint compromise requiring security investigation.
**Impact:** Single user. intune-test-dev blocked from Conditional Access after Defender for Endpoint elevated the device risk score.
**Urgency:** High. User cannot access corporate resources. Active security threat on endpoint requires investigation.
**SLA:** Response target 2 hours. Resolution target 4 hours. Case within SLA at time of logging.
**Affected CI:** intune-test-dev | Azure VM | West Europe | Corporate-owned
**Assignment group:** Endpoint Operations and Security Operations

---

## Summary

Alex Turner reported being unable to access corporate resources from intune-test-dev. Investigation confirmed Microsoft Defender for Endpoint had detected a threat on the device and elevated the risk score. The Intune compliance policy was configured with a Defender risk score threshold of Medium, causing the device to be marked non-compliant. The Require compliant Windows 10/11 devices Conditional Access policy then blocked access to corporate resources automatically.

---

## Investigation

### Step 1 - Sign-in log reviewed

Navigated to Entra admin centre, Sign-in logs, located the failed sign-in for Alex Turner. Conditional Access tab showed the policy Require compliant Windows 10/11 devices applied with a Failure result. Failure reason recorded as device not compliant.

### Step 2 - Device compliance state checked

Navigated to Intune admin centre, Devices, Windows, intune-test-dev. Device compliance status showed Not compliant. Opened the compliance breakdown and identified the Defender for Endpoint risk score setting as the failing condition. The device risk score was above the configured Medium threshold.

### Step 3 - Defender alert reviewed

Navigated to security.microsoft.com, Endpoints, Device inventory, located intune-test-dev. Active alert visible on the device record. Alert category showed the threat type and severity. Risk score confirmed as High, exceeding the Medium compliance threshold configured in Intune.

### Step 4 - Threat investigated

Opened the active alert in Defender and reviewed the threat details, affected files and recommended remediation actions. Identified the threat source and confirmed the scope of the compromise was limited to the affected device.

### Step 5 - Remediation executed

Followed the Defender recommended remediation steps to remove the threat from the device. Triggered a full antivirus scan through the Intune device action. Monitored the Defender alert status until it moved to Resolved.

### Step 6 - Compliance state restored

After threat remediation the Defender risk score returned to Clean. Intune re-evaluated device compliance on the next check-in cycle and compliance status moved back to Compliant. Conditional Access sign-in confirmed successful on retest.

**Finding:** Defender for Endpoint detected an active threat on intune-test-dev and elevated the risk score above the compliance threshold. The Intune and Conditional Access integration correctly blocked access to corporate resources automatically without manual intervention.

---

## Resolution

Threat remediated on intune-test-dev following Defender recommended remediation steps. Device risk score returned to Clean. Compliance status restored to Compliant on next Intune check-in. Alex Turner confirmed successful access to corporate resources after compliance was restored.

---

## Customer Update

Alex Turner,

Your access to corporate resources was blocked automatically because a security threat was detected on your device. The threat has been investigated and removed. Your device has been confirmed as secure and your access has been restored. No further action is required from you. Contact the IT support desk immediately if you notice any unusual behaviour on your device.

---

## Root Cause and Prevention

**Root cause:** A security threat was detected on intune-test-dev by Microsoft Defender for Endpoint. The Intune compliance policy risk score threshold correctly identified the device as non-compliant and Conditional Access correctly blocked access automatically.

**Prevention:** The automatic block is the prevention mechanism working as designed. To reduce impact on users when legitimate threats occur, ensure the Defender remediation workflow is documented so support engineers can resolve alerts quickly. Consider configuring Defender automated investigation and remediation to resolve low and medium severity threats without manual intervention.

---

## Screenshots

- defender-intune-connection.png
<img width="1678" height="977" alt="defender-intune-connection" src="https://github.com/user-attachments/assets/5f68769c-e5dd-4bd9-871a-33676a0660d1" />
  
- intune-defender-connection.png
<img width="1659" height="571" alt="intune-defender-connection" src="https://github.com/user-attachments/assets/3873155b-c243-49b4-a624-33f74fbd572b" />

  
