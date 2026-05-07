# Case 001 - New Joiner Licence and Group Access

**Type:** Service Request
**Priority:** P3 - Low impact, standard onboarding request with no business disruption
**Impact:** Single user, Alex Turner, unable to access Microsoft 365 services
**Urgency:** Normal - user starts in 24 hours
**Affected CI:** User account alex.turner@DalModernWorkplaceLab.onmicrosoft.com
**Assignment group:** IT Support - Identity and Access

## Summary
A new employee, Alex Turner, is joining the organisation and requires a Microsoft 365 
Business Standard licence and membership of the New Joiners security group to access 
company resources from day one.

## Investigation
1. Confirmed user account alex.turner@DalModernWorkplaceLab.onmicrosoft.com was 
created in Microsoft 365 admin centre.
2. Verified no licence was initially assigned to the account.
3. Confirmed New Joiners security group exists with Microsoft 365 Business Standard 
licence assigned at group level.
4. Confirmed user was not yet a member of the group.

## Resolution
1. Assigned Microsoft 365 Business Standard licence directly to the user account.
2. Added Alex Turner to the New Joiners security group.
3. Confirmed licence inheritance from group-based licensing was active.
4. Verified user account shows active status in Microsoft 365 admin centre.

## Customer update
Hi Alex, your Microsoft 365 account is now active. Your username is 
alex.turner@DalModernWorkplaceLab.onmicrosoft.com. You will receive a temporary 
password separately. Please sign in and change your password on first login. 
Contact IT support if you experience any access issues.

## Root cause and prevention
The user account was created without a licence assigned. Going forward, new joiner 
accounts will be added to the New Joiners security group at account creation, ensuring 
automatic licence assignment through group-based licensing and removing the risk of 
users starting without access.<img width="1350" height="293" alt="case-001-evidence" src="https://github.com/user-attachments/assets/90713579-7604-44c6-b569-c0be5f108810" />
