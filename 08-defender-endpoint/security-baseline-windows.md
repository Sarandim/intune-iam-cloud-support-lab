# Windows Security Baseline

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 14 May 2026

---

## Purpose

A Windows security baseline is a pre-configured set of Microsoft-recommended security settings applied to enrolled Windows devices through Intune. Instead of configuring hundreds of individual settings manually, the baseline applies all recommended settings in a single policy. It represents the minimum security configuration Microsoft considers appropriate for Windows devices in an enterprise environment.

---

## Baseline Applied

**Name:** Windows Security Baseline - Lab
**Template:** Security Baseline for Windows 10 and later, Version 25H2
**Assigned to:** All Devices
**Location:** Intune admin centre, Endpoint security, Security baselines, Security Baseline for Windows 10 and later

---

## What the Baseline Covers

The Security Baseline for Windows 10 and later Version 25H2 configures settings across the following categories:

| Category | Examples of settings enforced |
|---|---|
| Administrative Templates | Group policy settings for Windows components |
| Auditing | Security event logging requirements |
| Defender | Antivirus, real-time protection, cloud-delivered protection |
| Device Lock | Screen lock timeout, password requirements |
| Firewall | Windows Defender Firewall rules and profiles |
| Local Policies Security Options | User rights assignments and security options |
| Microsoft Edge | Browser security settings |
| Smart Screen | Application and browser SmartScreen enforcement |
| Windows Hello for Business | Biometric authentication settings |
| Virtualization Based Technology | Credential Guard and hypervisor-protected code integrity |

All settings are applied at Microsoft recommended values. In a production environment settings are reviewed against operational requirements before deployment and exceptions are documented.

---

## Why Security Baselines Matter in EMEA

Regulated EMEA environments require evidence that endpoints are hardened to a defined security standard. A security baseline provides that evidence in a single auditable policy. It covers the majority of CIS benchmark and Microsoft security recommendations in one deployment.

---

## Screenshots
<img width="1904" height="607" alt="windows-security-baseline-lab" src="https://github.com/user-attachments/assets/afa2250c-80cd-4e88-b718-bf931a2417d5" />
  
