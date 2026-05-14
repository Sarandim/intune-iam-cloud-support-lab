# Case 016 - Identifying Inactive Accounts and Producing a Report for Governance Review

**Type:** Service Request
**Priority:** P3 - No immediate user impact. Governance and compliance requirement.
**Impact:** Tenant-wide. Inactive accounts represent a potential security risk and a GDPR compliance gap.
**Urgency:** Low. Scheduled governance review. No active incident.
**SLA:** Response target 8 hours. Resolution target 5 business days. Case within SLA at time of logging.
**Affected CI:** Microsoft Entra ID user accounts | DalModernWorkplaceLab.onmicrosoft.com
**Assignment group:** Identity and Access Operations

---

## Summary

A governance review was requested to identify user accounts with no recent sign-in activity in the tenant. Inactive accounts that remain enabled represent a security risk and may violate GDPR data minimisation requirements. A Microsoft Graph PowerShell script was used to query sign-in activity across all accounts and produce a report for the governance team.

---

## Investigation

### Step 1 - Script executed

Connected to the tenant using Microsoft Graph PowerShell with User.Read.All and AuditLog.Read.All delegated scopes. Ran Get-StaleUsers.ps1 against the DalModernWorkplaceLab tenant.

### Step 2 - Output reviewed

The script returned four user accounts with the following last sign-in dates:

| Display Name | UPN | Last Sign-In |
|---|---|---|
| James Lebron | james.lebron@DalModernWorkplaceLab.onmicrosoft.com | Never |
| Maria Costa | maria.costa@DalModernWorkplaceLab.onmicrosoft.com | 08/05/2026 |
| Alex Turner | alex.turner@DalModernWorkplaceLab.onmicrosoft.com | 12/05/2026 |
| Sarandim | Sarandim@DalModernWorkplaceLab.onmicrosoft.com | 13/05/2026 |

### Step 3 - Stale account identified

James Lebron has no LastSignIn value, confirming the account has never been used since creation. The account is enabled and has an active licence assigned. Under the organisation's access review policy, accounts with no sign-in activity within 30 days are flagged for review.

### Step 4 - Account status verified

Confirmed in Entra admin centre that James Lebron's account is enabled with a Microsoft 365 Business Standard licence assigned. No business justification for the account being active without any sign-in activity was on record.

**Finding:** James Lebron's account has never been used since creation. The account is enabled and licenced. It represents an unnecessary attack surface and a potential GDPR data minimisation violation. The governance team must decide whether to disable, delete or investigate the account.

---

## Resolution

Governance report produced and delivered to the identity team containing all four user accounts with sign-in activity data. James Lebron's account flagged as requiring immediate review. Recommendation made to disable the account pending investigation into whether it is legitimately required.

Script output saved as evidence for the governance review record.

---

## Customer Update

Identity and Access Governance Team,

The inactive account review has been completed for the DalModernWorkplaceLab tenant. One account was identified with no sign-in activity since creation: james.lebron@DalModernWorkplaceLab.onmicrosoft.com. The account is currently enabled and licenced. Recommend disabling this account pending confirmation of business requirement. Full report is attached. Please advise on the action to be taken within 5 business days.

---

## Root Cause and Prevention

**Root cause:** User account created without a corresponding onboarding process being completed. The account was never activated by the user and no review mechanism was in place to identify it as inactive.

**Prevention:** Implement scheduled access reviews using Entra ID Governance Access Reviews to automatically flag accounts with no sign-in activity within a defined period. Automate account disablement for accounts exceeding the inactivity threshold using Lifecycle Workflows. Run Get-StaleUsers.ps1 on a monthly schedule as a supplementary governance check.

---

## Screenshots

- script-01-stale-signin-report.png

  <img width="824" height="262" alt="script-01-stale-signin-report" src="https://github.com/user-attachments/assets/4936d999-b6a1-4174-9586-9661572d44f7" />
