## Overview
 
This folder covers the Microsoft 365 administration foundations established on Day 2 of the sprint: licence management, group-based licensing, user administration, mailbox basics, and administrative role assignment. These are the operational tasks a Modern Workplace or Cloud Support engineer performs daily, and they form the layer that sits beneath identity, device, and security management.
 
All work was completed hands-on in the live tenant DalModernWorkplaceLab.onmicrosoft.com using the Microsoft 365 admin centre.
 
## Why This Matters in EMEA Environments
 
Every company running Microsoft 365 depends on correct licence assignment, clean group structure, and least-privilege administrative roles. A support engineer who can onboard a user, assign the right licence through a group, and grant the correct admin role without over-provisioning is performing the core daily function of the role. Group-based licensing in particular is what allows a small team to manage licensing for a large workforce without manual error.
 
## User Administration
 
A new employee account was created to demonstrate the standard onboarding flow.
 
| Field | Value |
|---|---|
| User | Alex Turner |
| Sign-in | alex.turner@DalModernWorkplaceLab.onmicrosoft.com |
| Location | Portugal |
| Licence | Microsoft 365 Business Standard |
 
Steps taken in the Microsoft 365 admin centre:
 
1. Navigated to Users, Active users, Add a user.
2. Entered the display name and username, set the usage location to Portugal because licence availability and service access are governed by usage location.
3. Assigned the Microsoft 365 Business Standard licence, which includes Exchange Online for mailbox, SharePoint, Teams, and the Office apps.
4. Completed creation and confirmed the account appeared in Active users with the licence applied.
## Group-Based Licensing
 
Rather than assigning licences to each user individually, a security group was used to apply licences automatically.
 
Steps taken:
 
1. Navigated to Groups, Active groups, Add a group.
2. Created a security group named New Joiners.
3. Opened the group, navigated to Licences, and assigned Microsoft 365 Business Standard to the group.
4. Added Alex Turner as a member, confirming the licence was inherited automatically through group membership.
The result is that any future joiner added to the New Joiners group receives the licence automatically with no manual assignment step, which removes a common source of human error and supports automated onboarding through lifecycle workflows later in the sprint.
 
## Mailbox Basics
 
The Microsoft 365 Business Standard licence provisions an Exchange Online mailbox automatically on licence assignment. The mailbox for the new user was confirmed under the Exchange admin centre, where recipient configuration, mailbox delegation, and mail flow settings are managed. In a support context, mailbox issues such as delegation, shared mailbox access, and quota are handled here rather than in Intune or Entra.
 
## Administrative Role Assignment
 
Administrative roles were assigned on a least-privilege basis so that no single non-owner account holds full tenant control.
 
| User | Role | Reason |
|---|---|---|
| Sarandim | Global Administrator | Tenant owner account only |
| Maria Costa | Helpdesk Administrator | Handles password resets, scoped to that function |
| James Lebron | User Administrator | Handles user and onboarding tasks, scoped to that function |
| Alex Turner | No administrative role | Standard user |
 
Steps taken:
 
1. Navigated to Roles, Role assignments in the Microsoft 365 admin centre, which surfaces the same directory roles managed in Microsoft Entra.
2. Assigned Helpdesk Administrator and User Administrator to the relevant accounts.
3. Kept Global Administrator on the owner account only, so that compromise of any operational account is contained to the scope of that role.
This least-privilege baseline is the foundation that is later locked down further through Privileged Identity Management in the identity governance work, where even these roles become time-limited and approval-gated rather than permanently held.
 
## ITIL Ticket Structure
 
Day 2 also established the ITIL ticket template reused across every support case in the portfolio. The template captures priority, impact, urgency, affected configuration item, assignment group, investigation steps, root cause, resolution, and a customer-facing update. The first service request, Case 001, documents a new joiner needing a Microsoft 365 licence and group membership, applying this structure end to end.
 
The full case library, including Case 001, is in 10-support-cases.
 
## Screenshots
 
- m365-user-created-alex-turner.png
  <img width="836" height="975" alt="m365-user-created-alex-turner" src="https://github.com/user-attachments/assets/1dba9e0d-461b-46cf-9cfd-cacea28d110d" />

- m365-group-based-licensing-new-joiners.png
  <img width="1915" height="816" alt="m365-group-based-licensing-new-joiners" src="https://github.com/user-attachments/assets/f1d1baf4-d23f-4904-a5d3-13972ffc752f" />

- m365-role-assignments-least-privilege.png
  <img width="1920" height="701" alt=" m365-role-assignments-least-privilege1" src="https://github.com/user-attachments/assets/7ec75909-60d9-4537-b8c8-23909e41b9e1" />


<img width="1914" height="770" alt=" m365-role-assignments-least-privilege2 png " src="https://github.com/user-attachments/assets/0156e01d-c92c-4cf6-8e1a-44af4b9ca23d" />
