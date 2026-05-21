**Title:** Contractor account retaining privileged group membership after departure
**Case:** 021
**Ticket number:** INC0010002
**Date:** 20 May 2026
**Reported by:** Sarandim Da Silva
**Affected user:** Alex Turner, alex.turner@DalModernWorkplaceLab.onmicrosoft.com
**Affected CI:** alex-turner-account
**CMDB field used:** Assigned to, sys_user table, ServiceNow CMDB
**Priority:** P2 - Security risk identified, privileged access retained by departed contractor.
**Urgency:** Normal
**Impact:** A contractor who departed two weeks ago retains membership of a privileged group, representing an uncontrolled access path to corporate resources and a potential audit finding.
**Assignment group:** IT Support - Identity and Access
**Change record reference:** CHG raised for Leaver-Offboard-Employee-Lab lifecycle workflow deployment

## Summary

This case is a simulated scenario based on the governance controls configured in this lab environment, designed to demonstrate the investigation and remediation process for a common access governance failure in regulated EMEA environments.

A routine access review identified that a contractor account retained privileged group membership two weeks after the contractor's departure. No automated offboarding process was in place to remove group memberships on the departure date. The account was not disabled and the group membership was not reviewed as part of the offboarding process. The risk is that the account remains an active access path to any resources controlled by the privileged group.

## Investigation Steps

1. Navigated to entra.microsoft.com, Identity, Users, located alex.turner@DalModernWorkplaceLab.onmicrosoft.com. Confirmed account status as enabled despite contractor departure date having passed.

2. Selected Groups from the user detail page. Confirmed the user retained membership of IT Support Staff, a group with elevated access scope used for Intune role assignments and SSPR configuration.

3. Navigated to Identity Governance, Privileged Identity Management, Assignments. Confirmed no PIM eligible assignment existed for the contractor account, meaning group-based access was not managed through PIM and had no expiry or approval requirement.

4. Reviewed Lifecycle Workflows under Identity Governance. Confirmed no leaver workflow was configured at the time of the contractor's departure. No automated offboarding process existed to disable the account or remove group memberships on the departure date.

5. Reviewed the sign-in logs for alex.turner@DalModernWorkplaceLab.onmicrosoft.com under Identity, Monitoring and health, Sign-in logs. Confirmed no sign-in activity since the departure date, indicating the access path had not been exploited but remained open.

6. Confirmed the governance failure: no access review, no lifecycle workflow, and no manual offboarding checklist resulted in the account retaining privileged group membership beyond the contractor's engagement period.

7. Looked up the affected user account in the ServiceNow CMDB under the sys_user table to confirm the account record and departure date fields, cross-referencing with the Entra account state.

## Resolution Steps

1. Navigated to entra.microsoft.com, Identity, Users, selected alex.turner@DalModernWorkplaceLab.onmicrosoft.com. Clicked Edit properties and set account status to Disabled.

2. Navigated to the Groups section of the user detail page. Removed the user from IT Support Staff.

3. Confirmed the account was disabled and all group memberships relevant to privileged access were removed.

4. Raised a change record for the Leaver-Offboard-Employee-Lab lifecycle workflow deployment to prevent recurrence.

5. Updated ServiceNow incident INC0010002 with resolution note and closed the ticket.

## Root Cause

No automated offboarding process existed at the time of the contractor's departure. The leaver lifecycle workflow that would have disabled the account and removed all group memberships on the departure date was not configured. Manual offboarding processes were not followed. The result was a contractor account retaining privileged group membership for two weeks after departure with no detection mechanism in place.

## Prevention

The Leaver-Offboard-Employee-Lab lifecycle workflow has been configured in Entra Identity Governance to automatically disable accounts and remove all group and Teams memberships on the defined leave date. For contractor accounts, the employeeLeaveDateTime attribute must be set at the point of onboarding so the leaver workflow triggers correctly on the departure date. Quarterly access reviews have been configured for privileged role assignments to provide a secondary detection mechanism for accounts that retain access beyond their intended scope.

## Customer Update

This case was raised internally following a routine access review. The affected contractor account has been disabled and privileged group membership has been removed. A governance workflow has been implemented to prevent recurrence. Incident INC0010002 is now closed. No further action is required from the affected party.

## Screenshots

- pim-audit-trail.png
<img width="1923" height="887" alt="pim-audit-trail" src="https://github.com/user-attachments/assets/9a396c29-760e-40cb-824b-d1b5422a0db4" />

- pim-access-review-created.png
<img width="1903" height="805" alt="pim-access-review-created" src="https://github.com/user-attachments/assets/7d5390a6-1834-432b-b40b-ece940837878" />

- lifecycle-workflow-leaver-created.png
<img width="1917" height="1033" alt="lifecycle-workflow-leaver-created" src="https://github.com/user-attachments/assets/1de86608-ee4c-4654-adc4-d62202dcbc2d" />
