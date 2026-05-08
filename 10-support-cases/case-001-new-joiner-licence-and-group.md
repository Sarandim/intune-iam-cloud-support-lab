# Case 001 - New Joiner Licence and Group Access

**Type:** Service Request
**Priority:** P3 - Standard onboarding request, no business disruption
**Impact:** Single user, onboarding access not provisioned at account creation
**Urgency:** Normal - user starts within 24 hours
**Affected CI:** User account alex.turner@DalModernWorkplaceLab.onmicrosoft.com
**Assignment group:** IT Support - Identity and Access

## Summary
A new joiner account was created in the Microsoft 365 admin centre without a 
licence or group membership assigned. The user requires a Microsoft 365 
Business Standard licence and membership of the New Joiners security group 
to access company resources from day one.

## Investigation
1. Received onboarding request via IT service request confirming start date 
and access requirements for the new joiner.
2. Located user account alex.turner@DalModernWorkplaceLab.onmicrosoft.com 
in the Microsoft 365 admin centre and confirmed no licence was assigned 
at account creation.
3. Confirmed the New Joiners security group exists with Microsoft 365 
Business Standard licence assigned at group level via group-based licensing.
4. Confirmed the user account was not a member of the New Joiners group.

## Resolution
1. Assigned Microsoft 365 Business Standard licence directly to the 
user account.
2. Added the user to the New Joiners security group.
3. Confirmed group-based licence inheritance was active and the licence 
showed as assigned on the user account.
4. Verified the user account status as active in the Microsoft 365 
admin centre.

## Customer update
Alex Turner - your Microsoft 365 account is now active. Sign in using 
alex.turner@DalModernWorkplaceLab.onmicrosoft.com with the temporary 
password provided separately. You will be prompted to change your password 
on first sign-in. Contact IT support if access issues are encountered.

## Root cause and prevention
The user account was created without a licence or group membership assigned. 
To mitigate the risk of licence assignment failures during onboarding, new 
joiner accounts will be added to the New Joiners security group at account 
creation, ensuring automatic licence assignment through group-based licensing.

## Screenshots
- case-001.png
<img width="1350" height="293" alt="case-001-evidence" src="https://github.com/user-attachments/assets/90713579-7604-44c6-b569-c0be5f108810" />
