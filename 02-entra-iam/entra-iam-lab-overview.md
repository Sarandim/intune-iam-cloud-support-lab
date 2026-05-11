# Entra ID Lab Overview

This document summarises what was built, configured and validated in the 
Entra ID lab across Days 1 to 5. It is written for a hiring manager or 
technical reviewer assessing hands-on identity and access management 
capability.

## What Was Built

A functioning Microsoft Entra ID environment configured to enterprise 
standards, including user lifecycle management, role-based access control, 
MFA and SSPR policy, and Conditional Access enforcement with location-based 
controls.

All configuration was completed in a live tenant, not a guided sandbox. 
Every policy decision is documented with reasoning in configuration-decisions.md.

## Tenant Configuration

| Area | Configuration |
|------|---------------|
| Users | Four accounts across IT and Operations departments |
| Groups | Two assigned security groups, one dynamic group with attribute-based membership rule |
| Licensing | Group-based licensing via New Joiners security group |
| Admin roles | Helpdesk Administrator and User Administrator assigned at least-privilege scope |
| MFA methods | Microsoft Authenticator, Software OATH tokens and Email OTP enabled, SMS and Voice disabled |
| SSPR | Enabled for IT Support Staff group, one method required, registration enforced |
| Conditional Access | Three policies: location-based MFA, compliant device, SharePoint MFA |
| Named location | Netherlands Office Network defined as trusted IP range |

## What Was Validated

Conditional Access policy evaluation confirmed via sign-in logs. Maria Costa 
signed in successfully from the trusted Netherlands network location without 
an MFA challenge. The same account triggered an MFA number matching prompt 
when signing in from an untrusted network location. Sign-in logs in Entra 
confirmed CA001 evaluated and enforced correctly in both scenarios.

Dynamic group membership rule verified. Maria Costa and James Lebron were 
automatically added to the Dynamic IT Users group on account creation without 
manual assignment, confirming the department attribute rule functions correctly.

SSPR authentication method dependency documented via support case. Case 004 
documents the scenario where a user cannot complete SSPR because no 
authentication method was registered. Resolution via Temporary Access Pass 
is documented end to end.

## Credential

Microsoft Applied Skill: Get started with identities and access using 
Microsoft Entra. Earned 8 May 2026. Online verifiable via Microsoft Learn 
profile.
