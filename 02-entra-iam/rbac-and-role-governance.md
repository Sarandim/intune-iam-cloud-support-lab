# RBAC and Admin Role Governance

## What is RBAC

Role Based Access Control is the practice of assigning permissions based on job function. Users receive only the access required to perform their role, limiting the impact of any compromised account.

## Least Privilege Principle

No user holds more permission than their job requires. Global Administrator is reserved for the tenant owner only, all other admin functions are delegated through scoped built-in roles.

## Role Assignments

| User | Role | Scope | Reason |
|---|---|---|---|
| Sarandim Da Silva | Global Administrator | Directory | Tenant owner and lab administrator |
| Maria Costa | Helpdesk Administrator | Directory | Handles password resets and basic user support |
| James Lebron | User Administrator | Directory | Manages users and groups for onboarding and offboarding |
| Alex Turner | No admin role | N/A | End user with no administrative responsibilities |

## Role Governance Rules Applied

- Global Administrator is held by one account only
- All other admin roles are scoped to job function
- No user holds multiple admin roles unnecessarily
- End users hold no administrative roles

## Built-in Roles Used

**Helpdesk Administrator**
Can reset passwords for non-admin users and manage basic service requests, and cannot modify security policies, Conditional Access or billing.

**User Administrator**
Can create, edit and delete users and groups, and assign licences, and cannot modify security policies or access Global Admin functions.

## Screenshots

- helpdesk-administrator-maria-costa.png
- user-administrator-james-lebron.png
<img width="1524" height="560" alt="helpdesk-administrator-maria-costa" src="https://github.com/user-attachments/assets/7677b84f-88f8-4ce9-a900-c24548655817" />

<img width="1531" height="574" alt="user-administrator-james-lebron" src="https://github.com/user-attachments/assets/6538e82c-fb2c-4075-bd9f-d40afe30cff3" />
