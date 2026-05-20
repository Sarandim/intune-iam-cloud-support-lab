## Overview
Lifecycle Workflows is a Microsoft Entra ID Governance feature that automates identity tasks triggered by employee lifecycle events. Instead of IT administrators manually enabling accounts, adding users to groups, sending welcome emails, and removing access when employees join, move, or leave, Lifecycle Workflows executes these tasks automatically based on defined triggers and conditions.

This document covers the three workflow categories, joiner, mover, and leaver, and documents the workflows built in this lab environment.

## Why Lifecycle Workflows Matter in EMEA Regulated Environments

Manual joiner and leaver processes are a common source of governance failures in EMEA enterprises. A new hire whose account is not enabled on their first day generates a helpdesk ticket and productivity loss. A leaver whose access is not removed promptly creates a security and compliance risk. Auditors in regulated industries specifically look for automated controls that remove human dependency from these critical identity lifecycle events.

## Workflow Categories

| Category | Trigger | Primary Use Case |
|---|---|---|
| Joiner | Employee hire date or pre-hire date | Automate account activation, group assignment, and welcome communications for new employees |
| Mover | Attribute change such as department or job profile | Automate access updates when an employee changes role, team, or location |
| Leaver | Employee leave date | Automate account disablement and access removal when an employee exits the organisation |

## Workflows Built in This Lab

## Joiner: Onboard New Hire Employee

| Setting | Value |
|---|---|
| Workflow name | Joiner-Onboard-New-Hire-Lab |
| Category | Joiner |
| Trigger | Time based, employeeHireDate, day 0 |
| Scope | department equals IT |
| Tasks | Enable User Account, Send Welcome Email, Add to New Joiners group |
| Schedule | Not scheduled, runs on trigger |

This workflow ensures that on the hire date, the new employee's account is enabled, a welcome email is sent, and the user is added to the New Joiners group which carries the Microsoft 365 Business Standard licence assignment. No manual IT intervention is required.

## Mover: Employee Job Profile Change

| Setting | Value |
|---|---|
| Workflow name | Job-Profile-Change-Lab |
| Category | Mover |
| Trigger | Attribute change, department |
| Scope | department equals IT |
| Tasks | Send email to notify manager, Remove from selected groups, Remove from selected Teams |
| Schedule | Not scheduled, runs on trigger |

This workflow runs when an employee's department attribute changes, notifying the manager and removing the user from groups and Teams channels that are no longer relevant to their new role. It prevents access accumulation when employees move between teams.

## Leaver: Offboard Employee

| Setting | Value |
|---|---|
| Workflow name | Leaver-Offboard-Employee-Lab |
| Category | Leaver |
| Trigger | Time based, employeeLeaveDateTime, day 0 |
| Scope | department equals IT |
| Tasks | Disable User Account, Remove from all groups, Remove from all Teams |
| Schedule | Not scheduled, runs on trigger |

This workflow ensures that on the leave date, the employee's account is disabled and all group and Teams memberships are removed automatically. This is the control that prevents the governance failure documented in Case 021, where a contractor retained privileged group access after leaving because no automated offboarding process existed.

## Screenshots

- lifecycle-workflow-joiner-created.png
<img width="1933" height="1078" alt="lifecycle-workflow-joiner-created" src="https://github.com/user-attachments/assets/a8ea58a0-cf80-43a6-829c-5c9b7c8c2244" />

  
- lifecycle-workflow-mover-created.png
<img width="1919" height="1049" alt="lifecycle-workflow-mover-created" src="https://github.com/user-attachments/assets/c435a67e-4290-41c8-a129-ac00e30462a8" />

  
- lifecycle-workflow-leaver-created.png

  <img width="1917" height="1033" alt="lifecycle-workflow-leaver-created" src="https://github.com/user-attachments/assets/6bfcd02e-cb3f-4400-8a66-4a3db8a6d48f" />
