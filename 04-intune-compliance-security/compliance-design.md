# Windows 10/11 Compliance Policy and Conditional Access Integration

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 13 May 2026

---

## Purpose

This document defines the device compliance requirements for Windows endpoints in the tenant and the Conditional Access policy that enforces compliance as a condition of access to corporate resources. The combination creates a security control chain where device state determines access.

---

## Compliance Policy - Windows 10 and later

**Location:** Intune admin centre, Devices, Compliance, Windows 10 Compliance Policy
**Platform:** Windows 10 and later
**Profile type:** Windows 10/11 compliance policy
**Assigned to:** New Joiners, IT Support Staff, Dynamic IT Users

### Configured Settings

| Category | Setting | Value | Reason |
|---|---|---|---|
| Device Health | BitLocker | Required | Encryption at rest protects data if a device is lost or stolen |
| Device Health | Secure Boot | Required | Prevents pre-boot malware from loading before the operating system |
| Device Health | Code Integrity | Required | Confirms that only signed trusted code can run in the kernel |
| Device Properties | Minimum OS version | 10.0.19045 | Windows 10 22H2 baseline ensures supported and patched OS |
| System Security | Antivirus | Required | Confirms real-time anti-malware protection is active |
| System Security | Antispyware | Required | Confirms anti-spyware protection is active |

### How Compliance Evaluation Works

Intune evaluates the device against these settings on each check-in. If all required settings are met the device is marked Compliant. If any required setting is not met the device is marked Non-compliant and the result is signalled to Entra ID. Conditional Access policies that reference compliance state then act on this signal.

---

## Conditional Access Policy - Require compliant Windows 10/11 devices

**Location:** Entra admin centre, Conditional Access, Policies, Require compliant Windows 10/11 devices

### Policy Configuration

| Element | Configuration |
|---|---|
| Name | Require compliant Windows 10/11 devices |
| Users or agents | Specific users included: lab tenant users |
| Target resources | 1 resource included |
| Conditions | None applied at this stage |
| Grant | Require device to be marked as compliant |
| Session | None applied at this stage |
| Enable policy | On |

### Enforcement Decision

The policy was set to On because the lab tenant contains a known and controlled set of users and devices. All users in scope were confirmed as lab accounts with no production dependency. Setting the policy to On produces real enforcement evidence and demonstrates confidence in the compliance configuration. In a production environment this policy would be validated in Report-only mode first, sign-in logs reviewed for would-be blocks, and compliance gaps resolved before enforcement is enabled.

---

## The Security Control Chain

Device enrolled in Intune, compliance policy evaluated at each check-in, device state reported to Entra ID as Compliant or Non-compliant, user attempts to access a corporate resource, Conditional Access policy evaluates the sign-in signal.

- Device Compliant: access granted
- Device Non-compliant: access blocked

This chain means a user cannot reach corporate resources from a device that does not meet the configured security baseline, regardless of whether the credentials are valid.

---

## Screenshots

Windows 10 Compliance Policy summary
<img width="907" height="870" alt="windows10_compliance_policy_summary" src="https://github.com/user-attachments/assets/1591a10d-fb09-4a12-b338-31969214e2dc" />

Conditional Access policy requiring compliant devices
<img width="1625" height="925" alt="conditional_access_compliant_devices" src="https://github.com/user-attachments/assets/56b25668-2b90-4eb6-b4c1-356800b653d1" />
