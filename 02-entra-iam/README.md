# Entra ID:  Identity and Access Management

This folder documents the Entra ID configuration built across Days 1 to 5 
of the lab. All configuration was completed in a live Microsoft 365 Business 
Standard tenant with Entra ID P2 and Entra ID Governance trials active.

## Files

| File | Contents |
|------|----------|
| entra-users-and-groups.md | User accounts, group types, dynamic membership rules and group-based licensing |
| rbac-and-role-governance.md | Admin role assignments scoped to least privilege across IT Support Staff |
| mfa-and-sspr.md | Authentication methods policy and SSPR configuration scoped to IT Support Staff group |
| conditional-access-design.md | Three Conditional Access policies with named location, trusted IP exclusion and MFA enforcement |

## Screenshots

| File | What it shows |
|------|---------------|
| entra-users.png | All four user accounts active in Entra |
| entra-groups.png | Security groups including dynamic group |
| dynamic-group-members.png | Dynamic group auto-populated via department attribute rule |
| helpdesk-administrator-maria-costa.png | Helpdesk Administrator role assigned to Maria Costa |
| user-administrator-james-lebron.png | User Administrator role assigned to James Lebron |
| mfa-authentication-methods.png | Authentication methods policy with enabled and disabled methods |
| sspr-properties.png | SSPR enabled and scoped to IT Support Staff group |
| conditional-access-policies.png | Three CA policies in Entra showing state and scope |
| maria-trusted-location-signin.png | Maria Costa signed in successfully from trusted Netherlands location |
| maria-mfa-prompt.png | Maria Costa challenged with MFA from untrusted network location |
