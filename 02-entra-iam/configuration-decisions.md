# Configuration Decisions: Entra ID

This file records the reasoning behind key configuration choices made during 
the lab. Each decision reflects a real-world principle applied to the 
tenant environment.

## User and Group Design

**Four users created across two departments.**
IT department: Sarandim Da Silva (Global Administrator), Maria Costa 
(Helpdesk Administrator), James Lebron (User Administrator).
Operations department: Alex Turner (standard user, no admin role).

This separation allows Conditional Access and SSPR policies to be scoped 
to IT staff only, reflecting a real-world phased rollout approach where 
stricter controls are validated on IT staff before broader enforcement.

**Dynamic group scoped to IT department via attribute rule.**
The Dynamic IT Users group uses the rule `user.department -eq "IT"` to 
auto-populate membership. Maria Costa and James Lebron were automatically 
added on account creation without manual group assignment. This validates 
that dynamic membership rules function correctly and reduces administrative 
overhead in environments with high staff turnover.

**Group-based licensing applied via New Joiners security group.**
Microsoft 365 Business Standard licences are assigned at group level rather 
than per user. Alex Turner received a licence automatically on joining the 
New Joiners group. This reflects enterprise practice where licence 
assignment is managed through group membership rather than individual 
assignment.

## Authentication Methods

**MFA methods enabled: Microsoft Authenticator, Temporary Access Pass, 
Software OATH tokens, Email OTP.**
Methods disabled: SMS, Voice call, FIDO2 security keys, Certificate-based 
authentication, QR code.

Microsoft Authenticator was prioritised as the primary method because it 
supports number matching, which defeats MFA fatigue attacks. SMS and Voice 
were disabled because they are vulnerable to SIM swapping and social 
engineering. Temporary Access Pass was enabled to support scenarios where 
a user cannot access their registered method, as demonstrated in Case 004.

## SSPR Configuration

**SSPR scoped to IT Support Staff group only.**
SSPR was not enabled for all users in the initial configuration. Scoping 
to IT staff first allows the authentication method registration process to 
be validated before rollout to the wider organisation. One authentication 
method is required to complete a password reset, balancing security with 
usability.

**Registration enforcement enabled.**
Users are prompted to register authentication methods on next sign-in. 
This prevents the scenario documented in Case 004, where a user who has 
never signed in since account creation has no registered method available 
when SSPR is needed.

## Conditional Access

**All policies initially set to Report-only.**
Report-only mode allows policy evaluation to be observed in sign-in logs 
without enforcing controls on users. This validates policy logic before 
enforcement and prevents unintended lockouts. CA001 was moved to On only 
after sign-in log review confirmed the trusted location exclusion was 
functioning correctly.

**CA001 scoped to IT Support Staff group.**
Scoping to IT staff before broader enforcement reflects a phased rollout 
approach. IT staff are best positioned to troubleshoot unexpected MFA 
prompts during the validation period.

**Trusted location defined using Netherlands VPN IP range.**
The named location Netherlands Office Network uses a specific IP range 
marked as trusted. Sign-ins from this range are excluded from the MFA 
requirement in CA001. This reflects a common enterprise pattern where 
office networks are trusted and remote or home networks require additional 
verification.
