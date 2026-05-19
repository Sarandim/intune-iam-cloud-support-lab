## Overview

This document defines the patching ring structure for a managed Windows environment using Microsoft Intune and Windows Update for Business. It covers four rings: Pilot, Broad, Executive, and Critical. The design follows a staged rollout model in which updates are validated on a small representative group before broader deployment.

This represents a reference ring architecture, the implemented lab configuration is Hotpatch-Ring-Win11-Lab, documented in autopatch-hotpatch-readiness.md.

## Patching Rings and Groups Matrix

| Ring | Target Group | Device Scope | Quality Update Deferral | Update Channel | Rollout Risk | Rollback Approach |
|---|---|---|---|---|---|---|
| Pilot | IT Support Staff | IT-managed devices, early adopters | 0 days | Windows Update for Business | Low, limited blast radius, issues caught before broad rollout | Pause ring via Intune update ring policy, uninstall via Windows Update uninstall period |
| Broad | All Corporate Devices | Standard workforce devices | 7 days | Windows Update for Business | Medium, large device population, deferral provides validation window | Pause ring, report via Intune device compliance dashboard, escalate to change advisory board |
| Executive | Senior Leadership Devices | Named executive devices requiring stability and minimal disruption | 14 days | Windows Update for Business | Low, small population, extended deferral reduces exposure to early-release issues | Manual uninstall via Intune remote action, priority support track |
| Critical | Finance and Regulated Workloads | Devices subject to compliance or regulatory constraints | 21 days | Windows Update for Business | Low deployment risk, high compliance risk if updates are withheld beyond policy window | Coordinated rollback via change record, compliance team notification required |

## Ring Design Principles

Deferral periods increase progressively from Pilot to Critical, this ensures that any update causing stability or compatibility issues is identified in the Pilot ring before reaching the broader population. The Broad ring absorbs the highest volume risk. The Executive and Critical rings carry the longest deferral windows because the consequence of disruption in those populations is disproportionate to the rest of the estate.

Rollback in all rings is non-destructive where possible, the Windows Update uninstall period is set to the maximum of 30 days across all rings, preserving the option to revert a quality update without a full device rebuild.

## Autopatch Alignment

In environments where Windows Autopatch is enabled, the Pilot and Broad rings map to the Autopatch Pilot and Broad rings respectively. Autopatch manages deferral and sequencing automatically for enrolled devices. The Executive and Critical rings remain manually managed in Intune to preserve the extended deferral windows and coordinated rollback process that Autopatch does not natively support for named device populations.

## Lab Implementation

win11-hotpatch-lab is assigned to Hotpatch-Ring-Win11-Lab, which functions as the Pilot ring equivalent in this lab environment. Zero deferral, two-day quality update deadline, and hotpatch delivery enabled via Hotpatch-Enable-Win11-Lab configuration profile.

## Screenshots

- hotpatch-ring-intune.png

  <img width="1428" height="551" alt="hotpatch-ring-intune" src="https://github.com/user-attachments/assets/ad5a3481-fe7c-4c81-9696-7b0726138392" />

- hotpatch-profile-intune.png
<img width="1423" height="637" alt="hotpatch-profile-intune" src="https://github.com/user-attachments/assets/f15eeaf1-8359-40af-9f7c-482be98832c6" />

  
