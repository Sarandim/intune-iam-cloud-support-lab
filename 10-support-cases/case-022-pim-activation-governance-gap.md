**Title:** Privileged role activation without justification or approval
**Case:** 022
**Date:** 20 May 2026
**Reported by:** Sarandim Da Silva
**Affected user:** Maria Costa, maria.costa@DalModernWorkplaceLab.onmicrosoft.com
**Affected CI:** maria-costa-account
**Priority:** P2 - Security control gap identified, privileged role settings not enforcing required governance controls.
**Urgency:** Normal
**Impact:** A proactive audit identified that privileged role settings in PIM were configured with default values, permitting role activation without MFA, justification, or approval. Any activation occurring under these settings produces no audit evidence and represents a governance gap inconsistent with regulated EMEA access control requirements.
**Assignment group:** IT Support - Identity and Access

## Summary

This case is a simulated scenario demonstrating the investigation and remediation process for a privileged role activation that bypassed the required governance controls. The scenario is based on the default PIM role settings state observed in this tenant before custom settings were applied. In the default state, PIM does not enforce MFA, justification, or approval requirements for role activation. This case documents how that gap would be identified through a proactive audit, the investigation steps required to confirm the scope of the exposure, and the remediation applied to bring the role settings into compliance with regulated EMEA governance requirements.

## Investigation Steps

1. Navigated to entra.microsoft.com, Identity Governance, Privileged Identity Management, Manage, Microsoft Entra roles, Settings. Reviewed the settings list and identified roles showing No in the Modified column, indicating default settings were in place with no custom approval or justification requirements configured.

2. Selected one of the unmodified roles to review the default settings. Confirmed that approval to activate was set to No, on activation require was set to None, and permanent eligible and active assignments were permitted. These defaults represent a governance gap in any regulated environment where privileged access must be justified, approved, and time-limited.

3. Navigated to Activity, Resource audit in PIM. Filtered by the role under review to identify any activation events that had occurred under the default settings. Reviewed each activation record to confirm whether justification and approval had been captured.

4. Confirmed that activations occurring under default settings produce no justification text and no approval record in the audit log, meaning there is no evidence trail for why the role was activated or who authorised it.

5. Reviewed all existing eligible and active assignments for the role. Confirmed that assignments created under default settings may have no defined end date, representing standing access with no expiry or renewal requirement.

6. Documented the findings as a governance gap requiring immediate remediation through role settings configuration and confirmed the scope of any existing assignments that needed review.

## Resolution Steps

1. Navigated to Identity Governance, Privileged Identity Management, Manage, Microsoft Entra roles, Settings. Selected the affected role and clicked Edit.

2. On the Activation tab, set On activation require to Azure MFA, set Require justification on activation to Yes, set Require approval to activate to Yes, and added Sarandim as the named approver.

3. On the Assignment tab, set Allow permanent eligible assignment to No with expiry after 1 year, set Allow permanent active assignment to No with expiry after 6 months, and set Require Azure MFA on active assignment to Yes.

4. Clicked Update to save the role settings. Confirmed the role now showed Yes in the Modified column with the correct timestamp and administrator identity recorded.

5. Navigated to Assignments and reviewed all existing eligible and active assignments for the affected role. Confirmed all assignments had defined end dates consistent with the updated policy.

6. Raised a change record documenting the role settings update, the rationale, and the review schedule for verifying ongoing compliance with the updated settings.

## Root Cause

The privileged role was added to PIM scope without a corresponding role settings review. Default PIM settings permit activation without MFA, justification, or approval, and allow permanent eligible and active assignments. In a regulated environment these defaults represent a governance failure because they provide no audit evidence for activation decisions and no automatic expiry for privileged access. The absence of a mandatory role settings configuration step in the change process for adding roles to PIM scope allowed the default state to persist undetected until a proactive audit was conducted.

## Prevention

All privileged roles managed through PIM must have custom role settings configured before any eligible assignments are created. The standard configuration requires MFA on activation, written justification, named approver, no permanent eligible or active assignments, and defined expiry windows for both eligible and active assignment types. A role settings audit must be completed quarterly to confirm all roles in PIM scope have the Modified status and that settings are consistent with the governance standard. New role additions to PIM scope must include role settings configuration as a mandatory step in the change process.

## Customer Update

This case was raised internally following a proactive audit of PIM role settings. The governance gap has been identified and the role settings have been updated to enforce the required controls. No further action is required from the affected party. A change record has been raised to document the remediation and the updated configuration is now in effect.

## Screenshots

- pim-role-settings-security-reader.png

<img width="1904" height="1032" alt="pim-role-settings-security-reader" src="https://github.com/user-attachments/assets/8587b9f7-5ba3-4308-9f05-4370fd501348" />

- pim-role-settings-detail-security-reader.png
  
<img width="1873" height="1075" alt="pim-role-settings-detail-security-reader" src="https://github.com/user-attachments/assets/b0435bf3-7381-4652-9b55-423dd8f1d851" />

- pim-audit-trail.png

<img width="1923" height="887" alt="pim-audit-trail" src="https://github.com/user-attachments/assets/ae8e4983-99b4-4cdc-83be-734239f22977" />
