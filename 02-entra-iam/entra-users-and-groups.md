# Entra ID Users and Groups

## What is Entra ID
Microsoft Entra ID is the cloud identity platform for Dal Modern Workplace Lab. 
Every user, group, device and application access decision flows through Entra ID.

## Users Created
| Display Name | UPN | Type | Created via |
<img width="1225" height="797" alt="entra-users" src="https://github.com/user-attachments/assets/320efa68-ce2a-4f05-bc52-b8383eb32e98" /><img width="1428" height="731" alt="entra-groups" src="https://github.com/user-attachments/assets/ff522827-381e-41c9-859e-e04b24169421" />

| Sarandim Da Silva | sarandim@DalModernWorkplaceLab.onmicrosoft.com | Global Admin | M365 admin centre |
| Alex Turner | alex.turner@DalModernWorkplaceLab.onmicrosoft.com | Member | M365 admin centre |
| Maria Costa | maria.costa@DalModernWorkplaceLab.onmicrosoft.com | Member | Entra admin centre |
| James Lebron | james.lebron@DalModernWorkplaceLab.onmicrosoft.com | Member | Entra admin centre |

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
