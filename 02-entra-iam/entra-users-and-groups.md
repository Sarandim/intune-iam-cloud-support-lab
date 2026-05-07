# Entra ID Users and Groups

## What is Entra ID
Microsoft Entra ID is the cloud identity platform for Dal Modern Workplace Lab. 
Every user, group, device and application access decision flows through Entra ID.
| Display Name | UPN | Role | Department |
|---|---|---|---|
| Sarandim Da Silva | sarandim@DalModernWorkplaceLab.onmicrosoft.com | Global Admin | IT |
| Alex Turner | alex.turner@DalModernWorkplaceLab.onmicrosoft.com | Member | Operations |
| Maria Costa | maria.costa@DalModernWorkplaceLab.onmicrosoft.com | Member | IT |
| James Lebron | james.lebron@DalModernWorkplaceLab.onmicrosoft.com | Member | IT |

## Groups Created
| Group Name | Type | Membership | Purpose |
|---|---|---|---|
| New Joiners | Security | Assigned | Onboarding access and M365 licence assignment |
| IT Support Staff | Security | Assigned | IT staff access control |
| Dynamic IT Users | Security | Dynamic | Auto-membership based on department equals IT |

## Dynamic Group Rule
Dynamic IT Users uses the following rule:
(user.department -eq "IT")
Any user with department set to IT is automatically added to this group.

## Key Concepts
- Assigned groups: members added manually by an admin
- Dynamic groups: members added automatically based on user attribute rules
- Security groups: used to control access to apps, policies and resources
- UPN: User Principal Name, the unique login identity for each user in Entra ID
  
  ## Screenshots
- entra-users.png
- entra-groups.png
- dynamic-group-members.png
  
  <img width="1225" height="797" alt="entra-users" src="https://github.com/user-attachments/assets/c62f056d-3924-4e3c-999a-9f2e1d2d488d" />
<img width="1428" height="731" alt="entra-groups" src="https://github.com/user-attachments/assets/4ec7f141-69bc-4eb2-a674-e169c673e4ce" />
<img width="1437" height="467" alt="dynamic-group-members" src="https://github.com/user-attachments/assets/0720a8ee-039e-46e5-bc79-42bb1fb6d7bd" />

