# Hybrid Identity - Microsoft Entra Connect

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 14 May 2026
**Note:** Architecture awareness document. Entra Connect requires an on-premises Windows Server with Active Directory Domain Services not available in this lab. All content is based on Microsoft Learn documentation and reflects real-world hybrid identity deployments in EMEA enterprise environments.

---

## Purpose

Hybrid identity connects an on-premises Active Directory environment to Microsoft Entra ID, Users have a single identity that works both on-premises and in the cloud. Microsoft Entra Connect is the tool that synchronises identity data between the two directories.

This is the most common identity architecture in large EMEA organisations. Companies running on-premises AD for years cannot migrate everything to the cloud at once. Hybrid identity allows them to extend existing identities to cloud services like Microsoft 365, Intune and Entra ID without replacing on-premises infrastructure.

---

## How Synchronisation Works

Entra Connect runs on a Windows Server joined to the on-premises AD domain, it reads user, group and device objects from on-premises AD and writes them to Entra ID every 30 minutes by default.

Objects synchronised from on-premises AD appear in Entra ID as synced identities. They are managed in on-premises AD and cannot be edited directly in Entra ID. Changes made on-premises are reflected in Entra ID after the next sync cycle.

| Object type | Synced from on-premises | Managed in |
|---|---|---|
| Users | Yes | On-premises AD |
| Groups | Yes | On-premises AD |
| Devices (hybrid joined) | Yes | On-premises AD and Entra ID |
| Cloud-only users | No | Entra ID only |

---

## Authentication Methods

Three authentication methods are available for hybrid identity, the choice determines where password validation happens.

**Password Hash Synchronisation (PHS)**

On-premises AD password hashes are synchronised to Entra ID, when a user signs in to a cloud service, Entra ID validates the password hash locally without contacting on-premises AD. Authentication happens in the cloud. Works even if on-premises infrastructure is unavailable. Simplest to deploy and the most common choice for EMEA organisations. Also enables leaked credential detection in Entra ID Identity Protection.

**Pass-Through Authentication (PTA)**

When a user signs in, Entra ID passes the authentication request to an on-premises authentication agent, the agent validates the password against on-premises AD and returns the result. Authentication happens on-premises. Password never leaves the on-premises environment. Requires at least one on-premises authentication agent running at all times. Chosen by organisations with strict compliance requirements around password storage.

**Federation with AD FS**

Authentication is fully delegated to an on-premises AD FS infrastructure, Entra ID redirects sign-in requests to the AD FS server which handles authentication and issues tokens. Most complex to deploy and maintain. Being replaced by PHS and PTA in most modern EMEA deployments due to operational overhead.

---

## Comparison

| Factor | PHS | PTA | Federation |
|---|---|---|---|
| Cloud resilience | High | Low | Low |
| On-premises dependency | Low | High | High |
| Deployment complexity | Low | Medium | High |
| Password stored in cloud | Hash only | No | No |
| Leaked credential detection | Yes | No | No |
| Recommended for most organisations | Yes | Specific cases | Legacy only |

---

## Common Hybrid Identity Support Scenarios

**Password change not reflecting in cloud**

User changes their on-premises AD password but cannot sign into Microsoft 365 with the new password, root cause is typically a sync delay or a broken Entra Connect sync cycle. Check Entra Connect sync status, review sync errors in Entra admin centre, confirm last sync timestamp, trigger a manual delta sync if required.

**User exists on-premises but not in Entra ID**

A new user was created in on-premises AD but does not appear in Entra ID, root cause is typically the user object falling outside the Entra Connect synchronisation scope, for example the user is in an OU not included in the sync filter.

**Hybrid joined device not appearing in Entra ID**

A device joined to on-premises AD is not showing as hybrid joined in Entra ID, root cause is typically a Service Connection Point configuration issue or a sync problem with the device object.

---

## Cross-reference

Case 015: On-premises password change not reflecting in cloud, see 10-support-cases/case-015-on-premises-password-not-reflecting-in-cloud.md

## Screenshots

None, Entra Connect is not available in this lab environment, this document is architecture awareness based on Microsoft Learn documentation.
