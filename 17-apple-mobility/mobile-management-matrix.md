## Overview

This document maps Apple device management capabilities to their management mechanism, licence requirement, and Conditional Access impact in a Microsoft Intune environment. It covers the full lifecycle from device enrolment through compliance enforcement, application deployment, and identity integration.

## Lab Environment

The following Apple devices were enrolled and managed in this lab.

| Device | Model | OS | Ownership | Enrolment Method | Compliance State |
|---|---|---|---|---|---|
| DAL's MacBook Air | MacBook Air M1 | macOS 26.5 | Personal | Company Portal | Compliant |

## Mobile Management Matrix

| Capability | Mechanism | Hands-on Status | Licence Requirement |
|---|---|---|---|
| Apple MDM Push Certificate | Configured in Intune under Devices, Enrolment, Apple | Completed | Intune Plan 1 |
| Company Portal enrolment | User downloads Company Portal, signs in with Entra ID credentials | Completed | Intune Plan 1 |
| macOS compliance policy | Created in Intune, assigned to All devices, enforced on real device | Completed | Intune Plan 1 |
| macOS configuration profile | Settings catalog profile, firewall settings confirmed Succeeded | Completed | Intune Plan 1 |
| App deployment | Microsoft Edge deployed as Required to All devices, confirmed Installed | Completed | Intune Plan 1 |
| FileVault encryption | Enforced via compliance policy, confirmed active on device | Completed | Intune Plan 1 |
| Password policy | Enforced physically on device via compliance policy, password reset triggered | Completed | Intune Plan 1 |
| Apple Business Manager | Web portal for corporate Apple device management and app purchasing | Concept-only, requires DUNS number | Requires ABM account |
| Automated Device Enrolment | Zero-touch corporate device provisioning via ABM | Concept-only, requires ABM | Requires ABM account |
| Apple Platform SSO | Entra ID credential mapped to macOS local account via Settings catalog profile and the Enterprise SSO plug-in | Concept-only, architecture documented | Intune Plan 1 |

## Apple Business Manager

Apple Business Manager is the enterprise portal that enables zero-touch device provisioning and volume app purchasing. It requires organisational registration with Apple using a DUNS number. In enterprise environments where devices are purchased through Apple or authorised resellers, ABM assigns devices to the Intune MDM server automatically so they enrol without any user action when first powered on.

The absence of ABM in a personal lab environment does not affect the core management capabilities demonstrated. Compliance policy enforcement, configuration profile deployment, app deployment, and Conditional Access integration all function identically whether the device was enrolled via Company Portal or Automated Device Enrolment.

## FileVault

FileVault is the macOS full-disk encryption technology equivalent to BitLocker on Windows. In an Intune-managed environment FileVault is enforced through the compliance policy. A device without FileVault enabled is marked non-compliant and blocked from corporate resources by Conditional Access. The recovery key can be escrowed to Intune so IT can retrieve it if a user is locked out.

In this lab FileVault enforcement was configured in the macOS-Compliance-Baseline-Lab compliance policy and confirmed active on the enrolled MacBook Air.

## Conditional Access Impact

| Device State | Conditional Access Result |
|---|---|
| Enrolled, compliant | Access to corporate resources permitted |
| Enrolled, non-compliant | Access blocked until compliance restored |
| Not enrolled | Access blocked by policy requiring managed device |
| FileVault disabled | Marked non-compliant, access blocked |
| OS version below minimum | Marked non-compliant, access blocked |

## Screenshots

- intune-all-devices-mixed-estate.png
  <img width="1914" height="677" alt="intune-all-devices-mixed-estate" src="https://github.com/user-attachments/assets/ba2931da-e58b-4e87-a95c-600d6f1f68ac" />

- macos-compliance-policy-detail.png
  <img width="1920" height="1072" alt="macos-compliance-policy-detail" src="https://github.com/user-attachments/assets/c24f2f3e-630a-47dd-b685-65a3c7f1c58f" />

- macos-compliance-policy-list.png
  <img width="1595" height="825" alt="macos-compliance-policy-list" src="https://github.com/user-attachments/assets/aa0ee8cf-6cc0-4b66-b7ab-c825241985e1" />

- macbook-air-compliance-status.png
  <img width="1905" height="738" alt="macbook-air-compliance-status" src="https://github.com/user-attachments/assets/d221971e-46cc-4799-aa0d-886218521e41" />

- macos-configuration-profile-list.png
  <img width="1902" height="837" alt="macos-configuration-profile-list" src="https://github.com/user-attachments/assets/2e30d32d-7cf7-4af0-8036-86da9600622d" />

- macbook-air-configuration-status.png
  <img width="1915" height="973" alt="macbook-air-configuration-status" src="https://github.com/user-attachments/assets/2792c5b1-6bf1-4188-8a3b-244364bf199b" />

- macos-edge-deployment-installed.png
  <img width="1901" height="796" alt="macos-edge-deployment-installed" src="https://github.com/user-attachments/assets/a95ee9f4-f85b-4bb5-8d76-21912078fcac" />
