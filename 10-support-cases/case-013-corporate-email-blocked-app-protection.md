# Case 013 - Corporate Email Refusing to Open on Personal Device Due to App Protection Condition

**Type:** Incident
**Priority:** P3 - Single user affected. Corporate email inaccessible on personal iOS device.
**Impact:** Single user. Microsoft Outlook on personal iPhone blocked from accessing corporate email by app protection policy.
**Urgency:** Medium. User unable to access corporate email on personal device. Corporate-owned device access unaffected.
**SLA:** Response target 4 hours. Resolution target 8 hours. Case within SLA at time of logging.
**Affected CI:** Personal iOS device, unmanaged, user-owned
**Assignment group:** Endpoint Operations

---

## Summary

Alex Turner reported that Outlook on their personal iPhone is displaying a block message and refusing to open corporate email. The device is not enrolled in Intune. Investigation confirmed the Outlook iOS App Protection policy detected the device as jailbroken and applied the configured block access action, preventing corporate email from loading on the compromised device.

---

## Investigation

**Step 1 - App protection policy status reviewed**

Navigated to Intune admin centre, Apps, Protection, selected Outlook iOS App Protection - BYOD. Opened Monitor, App protection status. Located Alex Turner in the user list. Policy status confirmed as applied. Conditional launch result showed Jailbroken device detected with action Block access.

**Step 2 - Policy configuration confirmed**

Reviewed the Conditional launch settings for the policy. Jailbroken devices is configured to Block access. This is the expected behaviour. The policy is working as designed.

**Step 3 - User confirmed device state**

Contacted Alex Turner and confirmed the device had been jailbroken. The user acknowledged the device modification and confirmed it was a personal device used to access corporate email under the organisation's BYOD policy.

**Finding:** The app protection policy correctly detected a jailbroken device and blocked access to corporate email as configured. The block is a security control functioning as intended, not a policy misconfiguration.

---

## Resolution

Access to corporate email on a jailbroken device cannot be restored while the device remains in a jailbroken state. This is by design. The app protection policy exists to prevent corporate data from being exposed on compromised devices.

Two options presented to the user:

1. Restore the device to factory settings to remove the jailbreak. Once the device passes the jailbreak check on next Outlook launch, access will be restored automatically.
2. Use a non-jailbroken personal device or request a corporate-owned device to access corporate email.

Alex Turner was informed that corporate data policy prohibits access from jailbroken devices regardless of device ownership. The block will remain in place until the device condition is resolved.

---

## Customer Update

Alex Turner,

Your access to corporate email on your personal iPhone has been blocked because the device has been modified in a way that violates the organisation's security policy. This block is applied automatically to protect corporate data. To restore access you will need to either restore your device to its original factory settings or use a different device that has not been modified. Contact the IT support desk once you have resolved the device condition and we will confirm access has been restored.

---

## Root Cause and Prevention

**Root cause:** The personal device used to access corporate email was jailbroken. The Outlook iOS App Protection policy is configured to block access from jailbroken devices. The policy applied the block access action as configured.

**Prevention:** This is expected policy behaviour, not a preventable failure. User awareness communications should clearly state that jailbroken or rooted devices cannot be used to access corporate email or other protected Microsoft 365 applications under the BYOD policy.

---

## Screenshots

- outlook-app-protection-ios.png
  <img width="1803" height="736" alt="outlook-app-protection-ios" src="https://github.com/user-attachments/assets/6a368674-4dee-4283-9bd5-d6da35727a36" />
