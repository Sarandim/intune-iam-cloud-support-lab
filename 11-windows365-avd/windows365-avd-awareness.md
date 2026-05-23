## Overview
 
This folder covers Windows 365 Cloud PC and Azure Virtual Desktop at concept level, as defined by Day 18 of the sprint. The goal is virtual endpoint awareness for modern endpoint roles: understanding what each technology is, how it differs from a physical managed PC, and when each is the correct choice.
 
This is documented as architecture awareness, not hands-on lab work. No Cloud PC or AVD host pool was provisioned in the tenant. The purpose is to be able to discuss virtual endpoints accurately and recommend the right option, which is what a Modern Workplace support role requires.
 
## Why This Matters in EMEA Environments
 
Many EMEA organisations use virtual endpoints to support remote and contract workers, to keep data off personal devices, and to provide access to specialised applications without shipping hardware. A support engineer is expected to understand the difference between a physical managed device, a Cloud PC, and an AVD session, and to know which one fits a given business need. Getting this wrong leads to over-spending on the wrong platform or failing to meet a security or compliance requirement.
 
## Managed PC, Cloud PC and AVD Compared
 
| Aspect | Physical Managed PC | Windows 365 Cloud PC | Azure Virtual Desktop |
|---|---|---|---|
| What it is | A physical device enrolled in Intune | A dedicated cloud PC assigned to one user | A flexible virtual desktop platform in Azure |
| Assignment model | One device, one or more users | One Cloud PC per user, always-on personal desktop | Personal or pooled, many users can share session hosts |
| Pricing model | Hardware cost plus management | Fixed per-user monthly licence | Consumption-based, pay for the Azure compute used |
| Management | Intune | Intune, the Cloud PC appears as a managed device | Intune for the session hosts plus Azure management |
| Best fit | A permanent employee with a company laptop | A user who needs a simple, predictable personal cloud desktop | Variable workloads, shared environments, and fine-grained scaling |
| Scaling | Buy more devices | Buy more per-user licences | Scale compute up and down based on demand |
| Complexity to run | Low | Low, designed to be simple | Higher, requires Azure design and host pool management |
 
## How They Relate to Intune
 
Both Windows 365 Cloud PC and AVD session hosts can be enrolled in Intune and managed with the same compliance policies, configuration profiles, and app deployments used for physical devices. This means the identity, compliance, and Conditional Access work documented elsewhere in this portfolio applies to virtual endpoints in the same way it applies to a physical laptop. A Cloud PC that fails a compliance policy is blocked by Conditional Access exactly as a physical device would be.
 
## When Each Is the Correct Choice
 
Choose a physical managed PC when a permanent employee needs a portable device for everyday work and offline capability.
 
Choose Windows 365 Cloud PC when a user needs a simple, predictable, always-available personal desktop in the cloud, for example a contractor, a remote worker on a personal device, or a role where data must not reside on local hardware. The fixed per-user price makes budgeting straightforward.
 
Choose Azure Virtual Desktop when the requirement involves variable demand, shared session hosts, or specialised scaling and cost control, for example a department of seasonal workers, a training environment, or an application that needs to be delivered to many users without giving each a full dedicated machine.
 
## Reference
 
A side-by-side comparison of managed PC, Cloud PC and AVD is documented in 01-architecture/cloud-endpoints.md.
