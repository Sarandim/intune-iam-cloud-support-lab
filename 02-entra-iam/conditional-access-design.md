# Conditional Access Design

## What is Conditional Access

Conditional Access is the policy engine in Microsoft Entra ID that evaluates 
signals at sign-in time and enforces access controls before granting access 
to a resource. Every policy defines who it applies to, what resource it 
protects, what conditions trigger it and what control is enforced.

## Policy Design Decisions

All three policies are scoped to the IT Support Staff security group rather 
than all users, following standard practice of validating policy behaviour 
on a defined group before expanding scope across the organisation.

All policies are set to Report-only mode, in this mode Entra evaluates every 
sign-in against the policy and logs what would have happened without blocking 
anyone, allowing the administrator to confirm policy logic before enforcement 
begins.

Security defaults will be disabled and policies moved to On once report-only 
validation confirms expected behaviour across sign-in log entries.

## Policies Configured

| Policy | Target Users | Target Resource | Condition | Control |
|---|---|---|---|---|
| CA001 - Require MFA Outside Trusted Locations | IT Support Staff | Office 365 | Any location except trusted | Require MFA |
| CA002 - Require Compliant Device for Office 365 | IT Support Staff | Office 365 | None | Require compliant device |
| CA003 - Require MFA for SharePoint Access | IT Support Staff | SharePoint Online | None | Require MFA |

## Policy Logic

**CA001** enforces MFA for any sign-in to Office 365 originating from an 
untrusted location. Sign-ins from trusted networks are excluded. No named 
trusted locations are currently defined in this tenant, which means all 
sign-ins would trigger MFA if the policy were set to On. Named locations 
will be configured with office network IP ranges before enforcement begins.

**CA002** requires the signing-in device to be marked as compliant in 
Microsoft Intune before access to Office 365 is granted. Device compliance 
policies will be configured in Intune as part of the endpoint security 
workstream. CA002 is designed in advance of that configuration to reflect 
the intended end state of the access control chain.

**CA003** requires MFA specifically for access to SharePoint Online 
regardless of location or device state. SharePoint is targeted by a 
dedicated policy because it holds sensitive organisational data and warrants 
an authentication requirement independent of network location.

## Report-Only Validation

Sign-in logs in Entra show Conditional Access evaluation results for each 
sign-in event. Under each sign-in record the Conditional Access tab shows 
which policies were evaluated, whether they would have applied and what 
control would have been enforced.

Validation of these policies is pending sign-in activity from users in scope. 
Once sign-in events are recorded the logs will be reviewed to confirm each 
policy evaluates as designed before security defaults are disabled and 
enforcement is enabled.

## Screenshots

- conditional-access-policies.png

  <img width="1616" height="665" alt="conditional-access-policies" src="https://github.com/user-attachments/assets/1a66fb64-361e-470f-9d48-9742adc86a58" />
