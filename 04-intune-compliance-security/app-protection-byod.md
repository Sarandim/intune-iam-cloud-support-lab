# App Protection Policy  Outlook iOS BYOD

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 14 May 2026

---

## Purpose

App protection policies control how corporate data is accessed and shared inside Microsoft 365 mobile apps on personal devices. Unlike device compliance policies which require full device enrolment, app protection policies apply at the application layer only. The personal device is never enrolled in Intune. Only the corporate data inside the protected app is managed.

This approach is the standard solution for BYOD scenarios in EMEA environments where enrolling personal devices raises GDPR concerns.

---

## How App Protection Works Without Device Enrolment

When a user signs into Outlook on a personal iPhone with their work account, Intune detects the app protection policy assigned to that user and applies the configured controls inside the Outlook app. The rest of the device, personal photos, personal email, personal apps, is never touched or visible to Intune.

The user experience is: Outlook asks for a PIN on first launch, enforces the PIN after inactivity, and blocks actions like copying corporate email content into personal apps or saving attachments to iCloud.

---

## Policy Configuration

**Policy name:** Outlook iOS App Protection - BYOD
**Platform:** iOS/iPadOS
**Target app:** Microsoft Outlook
**Assigned to:** All Users

Note: In a production environment this policy would be scoped to a dedicated BYOD user group rather than All Users, to allow different controls for corporate-owned enrolled devices versus personal unmanaged devices.

### Data Protection Settings

| Setting | Value | Reason |
|---|---|---|
| Backup org data to iCloud | Block | Prevents corporate email data leaving the managed app container |
| Send org data to other apps | Policy managed apps only | Blocks copying corporate content into personal apps like Notes or WhatsApp |
| Save copies of org data | Block | Prevents saving corporate attachments to personal iCloud or local storage |
| Receive data from other apps | Policy managed apps only | Blocks personal app content being pasted into corporate email |
| Cut, copy and paste | Policy managed apps with paste in | Restricts clipboard operations to managed apps only |
| Encrypt org data | Require | Ensures corporate data is encrypted at rest inside the app |
| Printing org data | Block | Prevents corporate email content being printed from personal devices |

### Access Requirements

| Setting | Value | Reason |
|---|---|---|
| PIN for access | Require | Ensures only the authorised user can access corporate email |
| PIN type | Numeric | Standard PIN format for mobile access |
| Simple PIN | Block | Prevents easily guessable PINs like 123456 |
| Minimum PIN length | 6 digits | Balances security with usability |
| Touch ID and Face ID | Allow | Permits biometric authentication as an alternative to PIN |
| Override biometrics with PIN after timeout | Require | Forces PIN re-entry after 30 minutes of inactivity |

### Conditional Launch Settings

| Setting | Value | Action |
|---|---|---|
| Max PIN attempts | 5 | Reset PIN |
| Offline grace period | 1440 minutes | Block access |
| Offline grace period | 90 days | Wipe data |
| Jailbroken device | - | Block access |

---

## The BYOD Protection Model

Personal device opens Outlook, user signs in with work account, Intune detects app protection policy assigned to the user, policy controls applied inside Outlook only, corporate data protected without touching personal device data.

If the device is jailbroken, Intune detects the compromised device state and blocks access to corporate email entirely. The personal device is not wiped. Only access to the corporate data inside Outlook is blocked.

---

## Screenshots

- outlook-app-protection-ios.png
  <img width="1803" height="736" alt="outlook-app-protection-ios" src="https://github.com/user-attachments/assets/b0fae2e9-6903-460f-9b60-8012d3fb5679" />
