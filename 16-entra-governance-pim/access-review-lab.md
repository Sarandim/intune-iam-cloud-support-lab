## Overview

Access reviews are a Microsoft Entra ID Governance feature that automates the periodic validation of user access to roles, groups, and applications. Instead of relying on manual processes to identify and remove stale or unnecessary access, access reviews send notifications to designated reviewers who confirm whether each user still requires their access. If a reviewer does not respond within the review period, the configured policy automatically removes access. This removes the dependency on human memory and manual audits for access hygiene.

This document covers the access review configured in this lab for the Security Reader privileged role assignment.

## Why Access Reviews Matter in EMEA Regulated Environments

Regulators and auditors in EMEA regulated industries require organisations to demonstrate that access to privileged roles and sensitive systems is reviewed at defined intervals and that access is removed promptly when it is no longer needed. Access reviews provide an automated, auditable mechanism that satisfies this requirement without relying on manual processes that are prone to gaps and delays.

## Access Review Configured

The following access review was created in this lab session.

| Setting | Value |
|---|---|
| Review name | Privileged-Role-Access-Review-Q2-2026 |
| Role under review | Security Reader |
| Assignment type | All active and eligible assignments |
| Frequency | Quarterly |
| Duration | 7 days |
| End | 4 occurrences |
| Reviewer | Sarandim |
| Auto apply results | Enabled |
| If reviewers do not respond | Remove access |
| Require reason on approval | Enabled |
| Recommendations | Enabled |

## Review Logic

The review runs quarterly starting 20 May 2026. Each review period lasts 7 days. Sarandim receives a notification to review all active and eligible Security Reader assignments and must confirm or deny continued access for each user. If no response is provided within 7 days, access is automatically removed. This enforces access hygiene without requiring manual intervention.

Recommendations are enabled, meaning Entra will surface sign-in activity data to the reviewer to indicate whether each user has recently used the role. A user who has not used the Security Reader role in the past 30 days will be flagged as a candidate for removal.

## Scope Note

The plan for this lab referenced access reviews for guest users or privileged group membership. No guest users exist in this tenant. The access review was scoped to the Security Reader privileged role assignment, which represents the privileged group membership use case. In a production environment containing guest users, a separate access review would be created targeting guest accounts specifically, with a more aggressive frequency such as monthly and a shorter review duration of 3 days.

## Screenshots

- pim-access-review-created.png

  <img width="1903" height="805" alt="pim-access-review-created" src="https://github.com/user-attachments/assets/fe37b69e-74d9-47ec-83fb-e7e346858a39" />
