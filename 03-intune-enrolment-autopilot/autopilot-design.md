# Windows Autopilot Design

## Overview
This document describes the Windows Autopilot deployment approach 
configured in the lab tenant, covering deployment mode selection, 
design decisions and the scenarios each mode addresses.

## Deployment Modes

| Mode | Use case | User involvement | IT involvement |
|------|----------|-----------------|----------------|
| User-driven | Remote worker receives device directly | Signs in with work account during OOBE | None after profile assignment |
| Self-deploying | Shared devices, kiosks, meeting room hardware | None | Device configures without user interaction |

## Profile Configured

| Setting | Value | Reason |
|---------|-------|--------|
| Deployment mode | User-driven | Remote workers receive devices without IT handling |
| Join type | Microsoft Entra joined | Cloud-only tenant, no on-premises Active Directory |
| License terms | Hidden | Streamlines OOBE for end users |
| Privacy settings | Hidden | Privacy configuration managed via Intune policy |
| User account type | Standard | Least privilege, local admin rights not required |
| Pre-provisioned deployment | Disabled | Not required for this tenant and deployment scenario |
| Device name template | Not configured | Naming convention to be defined at hardware registration |

## Hardware Hash Requirement

Autopilot applies a deployment profile only after the device hardware 
hash is registered in the tenant. In production this is handled by the 
device manufacturer uploading the hash before shipping, or by an 
administrator running a PowerShell script on the device prior to deployment.

## Deployment Scenario Reference

| Scenario | Recommended method | Reason |
|----------|--------------------|--------|
| New remote hire receiving device by post | Autopilot user-driven | No IT handling of hardware required |
| Shared kiosk or meeting room device | Autopilot self-deploying | No user account required for setup |
| Device replacement for existing user | Autopilot user-driven | Consistent experience across device lifecycle |
| Lab or test device | Manual Entra join | Faster for single device testing without hash registration |

## Screenshots
- autopilot-deployment-profile.png
  <img width="1922" height="614" alt="autopilot-deployment-profile" src="https://github.com/user-attachments/assets/64713354-5159-4ac4-a6f6-b1a9049ffb27" />
