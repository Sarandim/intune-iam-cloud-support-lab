# Cloud Endpoints - Managed PC vs Windows 365 Cloud PC vs Azure Virtual Desktop

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 14 May 2026
**Note:** Architecture awareness document. Windows 365 and AVD require additional licensing and infrastructure not available in this lab. Content is based on Microsoft Learn documentation.

---

## Purpose

Modern endpoint roles in EMEA require awareness of three distinct Windows delivery models, the correct choice depends on the organisation's security requirements, user profile, cost model and management capability. This document compares all three and provides guidance on when each is the appropriate solution.

---

## The Three Models

### Managed PC

A physical or virtual Windows device enrolled in Microsoft Intune, the device exists as hardware or a virtual machine. Intune manages configuration, compliance, app deployment and security policies. The user has a dedicated device assigned to them.

**Management:** Microsoft Intune
**Where it runs:** On physical hardware or a VM hosted anywhere
**User experience:** Full Windows desktop on a dedicated device
**IT overhead:** Hardware procurement, device lifecycle management, Intune configuration

---

### Windows 365 Cloud PC

A dedicated cloud-hosted Windows PC assigned to a single user, Microsoft provisions and maintains the underlying infrastructure. The user accesses their Cloud PC through a browser or the Windows App from any device. IT manages it through Intune exactly like a physical device.

**Management:** Microsoft Intune and Microsoft 365 admin centre
**Where it runs:** Microsoft Azure, managed entirely by Microsoft
**User experience:** Full Windows desktop accessible from any device or browser
**IT overhead:** Licence assignment and Intune policy configuration only. No hardware management.

---

### Azure Virtual Desktop (AVD)

A Microsoft Azure service that delivers virtualised Windows desktops and applications to users. Unlike Windows 365, AVD uses shared infrastructure where multiple users can run sessions on the same virtual machine. IT builds and manages the session host VMs in Azure.

**Management:** Azure portal, Microsoft Intune for policy, Azure Virtual Desktop service
**Where it runs:** Microsoft Azure, managed by the IT team
**User experience:** Windows desktop or individual applications streamed to any device
**IT overhead:** VM build and maintenance, session host management, Azure cost management, Intune policy configuration

---

## Comparison

| Factor | Managed PC | Windows 365 Cloud PC | AVD |
|---|---|---|---|
| Hardware required | Yes | No | No |
| Dedicated to one user | Yes | Yes | No, shared |
| Managed by Intune | Yes | Yes | Partially |
| Microsoft manages infrastructure | No | Yes | No |
| IT builds and manages VMs | No | No | Yes |
| Best for | Standard office and remote workers | Remote workers needing flexibility | Shared workloads, seasonal workers, call centres |
| Cost model | Hardware plus licence | Per user per month licence | Azure compute plus licence |
| Complexity | Medium | Low | High |

---

## When to Use Each

**Use Managed PC when:**
The user needs a dedicated device, the organisation has existing hardware procurement processes, and the IT team has Intune management capability in place. This is the standard choice for most EMEA office and remote workers.

**Use Windows 365 Cloud PC when:**
The user works from multiple locations or devices and needs a consistent Windows environment without carrying hardware. Ideal for remote workers, contractors and users in locations where hardware procurement is difficult. IT overhead is minimal because Microsoft manages the underlying infrastructure.

**Use Azure Virtual Desktop when:**
Multiple users need access to the same application environment without dedicated devices, common in call centres, seasonal worker scenarios, regulated financial environments where data must never leave Azure, and organisations that need to deliver specific legacy applications to large user groups without installing them on individual devices.

---

## How All Three Connect to Intune

All three endpoint types can be managed through Microsoft Intune for compliance policies, configuration profiles and app deployment. The management experience in Intune is consistent regardless of whether the device is physical, a Cloud PC or an AVD session host. This is why Intune knowledge is transferable across all three delivery models.

---

## Screenshots

None, this is an architecture awareness document, no hands-on configuration was performed in this lab.
