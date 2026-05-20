## Overview

This matrix maps identity types present in a managed Entra ID environment to their required access review frequency, the trigger that initiates a review, and the condition that results in access removal. It provides a reference governance framework for identity lifecycle management in regulated EMEA environments.

## Governance Evidence Matrix

| Identity Type | Access Review Frequency | Review Trigger | Removal Condition |
|---|---|---|---|
| Permanent employee, standard user | Annual | Scheduled access review | Manager confirms role change or departure |
| Permanent employee, privileged role | Quarterly | Scheduled PIM access review | Reviewer does not confirm continued need within review period |
| Contractor or fixed-term employee | Monthly | Scheduled access review or contract end date | Contract end date reached or reviewer does not confirm continued need |
| Guest user | Monthly | Scheduled access review | Reviewer does not confirm continued need within review period |
| Service account | Semi-annual | Scheduled access review | Owning team cannot confirm active business use |
| Break-glass account | Manual, every 90 days | Credential rotation schedule | Not removed, credentials rotated and access monitored |
| Eligible PIM assignment | At assignment expiry | PIM assignment end date | Assignment expires and is not renewed by an authorised reviewer |
| Active PIM assignment | At assignment expiry | PIM assignment end date | Assignment expires and is not renewed or converted to eligible |

## Review Frequency Rationale

Privileged roles are reviewed quarterly because the risk of stale privileged access is significantly higher than stale standard access. A compromised standard user account has limited blast radius. A compromised privileged role account can modify policies, disable security controls, and exfiltrate data at scale.

Contractors are reviewed monthly because their tenure is time-limited and contract end dates are frequently not communicated to IT in advance. Monthly reviews create a regular checkpoint that catches leavers before their access accumulates beyond their engagement period.

Guest users are reviewed monthly because external identities represent a higher risk surface than internal accounts. Guest access is typically granted for a specific purpose and should be removed as soon as that purpose is fulfilled.

## Lab Implementation Reference

In this lab environment the following governance controls are active.

| Control | Configuration |
|---|---|
| PIM eligible assignment | Security Reader, Maria Costa, expires 19 August 2026 |
| PIM role settings | MFA required, justification required, approval required, no permanent assignments |
| Access review | Privileged-Role-Access-Review-Q2-2026, quarterly, Security Reader, auto-remove on no response |
| Leaver workflow | Leaver-Offboard-Employee-Lab, disables account and removes all group memberships on leave date |
| Joiner workflow | Joiner-Onboard-New-Hire-Lab, enables account and assigns to New Joiners group on hire date |
| Mover workflow | Job-Profile-Change-Lab, removes group and Teams memberships on department attribute change |

## Screenshots

- pim-audit-trail.png

  <img width="1923" height="887" alt="pim-audit-trail" src="https://github.com/user-attachments/assets/15c4491b-cd86-46e1-841e-91b03d3e85e7" />

- pim-access-review-created.png

  <img width="1903" height="805" alt="pim-access-review-created" src="https://github.com/user-attachments/assets/6cd888c4-93f0-4758-9b44-43045fba9634" />
