# Case 008 - Device Flagged Non-Compliant Blocking Access to Corporate Resources

**Type:** Incident
**Priority:** P3 - Single user unable to access corporate resources from primary device. No wider service impact confirmed.
**Impact:** Single user. Access to corporate applications blocked by Conditional Access due to device non-compliance.
**Urgency:** High. User cannot perform daily work tasks until device compliance is restored.
**SLA:** Response target 4 hours. Resolution target 8 hours. Case within SLA at time of logging.
**Affected CI:** intune-test-dev | Azure VM | West Europe | Corporate-owned
**Assignment group:** Endpoint Operations

---

## Summary

Alex Turner reported being unable to access corporate resources from intune-test-dev. Sign-in returned a Conditional Access block indicating the device does not meet the organisation's access requirements. Investigation confirmed the device failed compliance evaluation against the Windows 10 Compliance Policy and was blocked by the Require compliant Windows 10/11 devices Conditional Access policy set to On. Root cause identified as BitLocker not enabled on the operating system drive.

---

## Investigation

**Step 1 - Sign-in log reviewed**

Navigated to Entra admin centre, Sign-in logs, located the failed sign-in for Alex Turner. Conditional Access tab showed the policy Require compliant Windows 10/11 devices applied with a Failure result. Failure reason recorded as device not compliant.

**Step 2 - Device compliance state checked**

Navigated to Intune admin centre, Devices, Windows, intune-test-dev. Device compliance status showed Not compliant. Opened the Device compliance section and reviewed the per-setting evaluation against Windows 10 Compliance Policy.

**Step 3 - Failing setting identified**

The compliance breakdown showed BitLocker as Not compliant. All other required settings including Secure Boot, Code Integrity, Minimum OS version 10.0.19045, Antivirus and Antispyware returned Compliant. BitLocker was the single setting causing the overall non-compliant state.

**Step 4 - Device state confirmed**

On the device ran `manage-bde -status C:` from an elevated command prompt. Output confirmed BitLocker protection was off for the operating system drive. No BitLocker configuration profile had been deployed to the device at this stage of the environment build.

**Finding:** intune-test-dev failed BitLocker compliance because BitLocker had not been enabled on the operating system drive. The Windows 10 Compliance Policy correctly flagged the device as non-compliant and the Conditional Access policy correctly blocked access. The remediation path requires a BitLocker configuration profile to be created and deployed through Intune.

---

## Resolution

Root cause confirmed and documented. Immediate remediation requires a BitLocker configuration profile to be built and deployed through Intune targeting intune-test-dev. This change has been raised as a follow-on task. Pending profile deployment the device remains non-compliant and access to the targeted resource remains blocked.

As an interim measure the Conditional Access policy assignment was reviewed to confirm no additional users or devices were affected beyond the single device under investigation.

---

## Customer Update

Alex Turner,

Your device is currently blocked from accessing corporate resources because BitLocker encryption is not enabled. The IT support team has identified the cause and is preparing the configuration needed to enable BitLocker on your device. You will be notified when the fix has been deployed and access has been restored. Contact the IT support desk if you have any questions in the meantime.

---

## Root Cause and Prevention

**Root cause:** intune-test-dev did not have BitLocker enabled at the time the compliance policy began evaluating devices. The compliance policy correctly identified the gap and Conditional Access correctly enforced the result.

**Prevention:** Deploy a BitLocker configuration profile to all in-scope Windows devices at the same time the compliance policy is published. Newly enrolled devices should reach a compliant state on their first check-in. Review sign-in logs after enforcement begins to confirm no users are unexpectedly blocked.

---

## Screenshots

- windows10_compliance_policy_summary.png
- conditional_access_compliant_devices.png

  <img width="907" height="870" alt="windows10_compliance_policy_summary" src="https://github.com/user-attachments/assets/65d1304f-af30-446e-8ada-dd9e0d57b754" />
<img width="1625" height="925" alt="conditional_access_compliant_devices" src="https://github.com/user-attachments/assets/e3711392-17ad-425e-acba-7413ac74436c" />
