# Architecture Overview - Entra ID, Intune, Microsoft 365 and Defender

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 14 May 2026

---

## Purpose

This document provides an architecture overview of how the four core Microsoft cloud services used in this portfolio connect and interact. Understanding how these services relate to each other is essential for effective support investigation. A symptom in one layer often has its root cause in another.

---

## The Four Layers

### Microsoft Entra ID - Identity Layer

Every user, device and application starts here, Entra ID manages authentication, authorisation, group membership, Conditional Access policies and application SSO. When a user cannot access a resource the investigation almost always starts in Entra ID sign-in logs.

### Microsoft Intune - Device Management Layer

Intune manages enrolled devices, it deploys configuration profiles, enforces compliance policies, deploys applications and reports device state back to Entra ID. Device compliance state evaluated by Intune feeds directly into Conditional Access decisions in Entra ID.

### Microsoft 365 - Productivity Layer

Microsoft 365 delivers the applications and services users access daily including SharePoint, Exchange, Teams and Microsoft 365 Apps. Licences are assigned here. Access to Microsoft 365 services is controlled by Entra ID Conditional Access policies using signals from Intune device compliance.

### Microsoft Defender for Endpoint - Security Layer

Defender monitors enrolled devices for threats and assigns a risk score to each device. This risk score is shared with Intune via the established connector. Intune incorporates the Defender risk score into the device compliance evaluation. A device with an elevated risk score is automatically marked non-compliant and blocked from corporate resources by Conditional Access.

---

## How the Four Services Connect

Entra ID is the central identity authority, all three other services connect to it.

Intune reports device compliance state to Entra ID. Conditional Access in Entra ID uses this signal to allow or block access to Microsoft 365 services.

Defender for Endpoint reports device risk scores to Intune, Intune incorporates the risk score into compliance evaluation and reports the result to Entra ID.

Microsoft 365 services are the protected resources, access is granted or denied by Entra ID Conditional Access based on user identity, device compliance state and Defender risk score.

---

## Signal Flow for Access Decisions

User attempts to access SharePoint, Entra ID evaluates the sign-in against all applicable Conditional Access policies, Conditional Access checks device compliance state from Intune, Intune compliance state incorporates Defender risk score, if all signals pass access is granted, if any signal fails access is blocked.

---

## Support Investigation Map

When a user reports an access failure the investigation follows this order:

| Layer | Tool | What to check |
|---|---|---|
| Identity | Entra admin centre, Sign-in logs | Which CA policy blocked the sign-in and why |
| Device compliance | Intune admin centre, Device record | Which compliance setting is failing |
| Endpoint security | security.microsoft.com, Device inventory | Whether Defender has flagged an active threat |
| Licence | Microsoft 365 admin centre, User licences | Whether the required licence is assigned |
| Group membership | Entra admin centre, User groups | Whether the user is in the required groups |
| Application SSO | Entra admin centre, Enterprise apps, Sign-in logs | Whether the SSO token contains the correct attributes |

---
