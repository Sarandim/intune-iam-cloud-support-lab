This document covers the three primary mechanisms for managing Windows updates in a Microsoft Intune environment: update rings, Windows Autopatch, and hotpatching. It documents the readiness checks performed on win11-hotpatch-lab and the configuration applied during the Day 23 lab session.

The lab environment uses Microsoft 365 E5 with Intune Plan 1, the enrolled device is win11-hotpatch-lab, a Windows 11 Enterprise 25H2 Azure VM in West Europe.

## Update Management Mechanisms

| Mechanism | Type | Use Case | Eligibility | Management Interface | Limitation |
|---|---|---|---|---|---|
| Update rings | Policy-based deferral | Control timing of quality and feature updates across device groups | All Windows 10 and later devices enrolled in Intune | Intune — Devices, Windows, Update rings | Requires manual group targeting and ring design |
| Windows Autopatch | Orchestration service | Automate update sequencing across Pilot, Fast, Broad, and Last rings without manual ring management | Windows 10 1809 or later, Microsoft 365 E3 or higher, Intune enrolment, no co-management conflict | Intune — Devices, Windows, Autopatch | Not available in all regions, requires licence eligibility check before enrolment |
| Hotpatching | In-memory update delivery | Apply security updates without requiring a device restart | Windows 11 Enterprise 24H2 or later, VBS enabled, device receiving updates via Windows Update for Business | Intune — Configuration profiles, Settings catalog | Requires VBS active at runtime, not compatible with all update channels |

## Windows Autopatch and Update Rings

Windows Autopatch is not a replacement for update rings, it is an orchestration layer that manages update rings on behalf of the administrator. When a device is enrolled in Autopatch, Microsoft creates and manages four internal rings: Pilot, Fast, Broad, and Last. The administrator no longer configures deferral periods manually. Autopatch handles sequencing, monitors update health, and pauses rollouts automatically if failure rates exceed threshold.

Update rings configured manually in Intune remain the appropriate mechanism for environments that require custom ring design, specific deferral windows, or granular control over rollout pace. Both mechanisms consume Windows Update for Business as the underlying update service.

## VBS Readiness and Hotpatch Eligibility

Virtualization Based Security is a hardware-enforced security boundary that isolates critical OS components from the rest of the system using the hypervisor. Hotpatch requires VBS to be active at runtime because the in-memory patching mechanism operates within the VBS-protected environment.

VBS status was confirmed on win11-hotpatch-lab via Azure Run command using the following check:

```powershell
Get-CimInstance -Namespace root/Microsoft/Windows/DeviceGuard -ClassName Win32_DeviceGuard | Select-Object VirtualizationBasedSecurityStatus, SecurityServicesRunning
```

Result: VirtualizationBasedSecurityStatus = 2 (running), SecurityServicesRunning = {1, 2} confirming Credential Guard and HVCI active.

## Hotpatch Eligibility Checklist

| Requirement | Status |
|---|---|
| Windows 11 Enterprise 24H2 or later | Confirmed, 25H2 |
| VBS enabled and running | Confirmed, status 2 |
| Device enrolled in Intune | Confirmed |
| Receiving updates via Windows Update for Business | Confirmed via update ring assignment |
| Hotpatch configuration profile applied | Confirmed, Hotpatch-Enable-Win11-Lab |

## Configuration Applied

Two policies were created and assigned to win11-hotpatch-lab during this lab session.

Hotpatch-Ring-Win11-Lab is a Windows Update ring with zero quality update deferral, a two-day quality update deadline, a one-day grace period, and automatic restart behaviour enabled. This ensures updates are delivered promptly without indefinite deferral.

Hotpatch-Enable-Win11-Lab is a Settings catalog configuration profile with Enable Hotpatch Auto Remediation set to Enabled. This activates in-memory hotpatch delivery for eligible updates.

See patching-rings-and-groups-matrix.md for the full ring structure, group targeting logic, rollout risk ratings, and rollback notes.

## Screenshots

- vbs-status-win11-hotpatch-lab.png

  <img width="1150" height="438" alt="vbs-status-win11-hotpatch-lab" src="https://github.com/user-attachments/assets/bc6ade9a-c4b1-4781-aa14-a3f788640767" />

- win11-hotpatch-lab-enrolled.png
<img width="1373" height="629" alt="win11-hotpatch-lab-enrolled" src="https://github.com/user-attachments/assets/1dff4600-920f-4483-ac58-9b0962ac2c9a" />

- hotpatch-ring-intune.png

  <img width="1428" height="551" alt="hotpatch-ring-intune" src="https://github.com/user-attachments/assets/118609f9-d8e7-4f03-9558-202a7b5d9ba1" />

- hotpatch-profile-intune.png
<img width="1423" height="637" alt="hotpatch-profile-intune" src="https://github.com/user-attachments/assets/05938451-8be9-48d1-b74e-8adf9054611a" />

  
