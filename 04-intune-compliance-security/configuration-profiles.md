**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 13 May 2026

---

## Purpose

Configuration profiles push settings to enrolled Windows devices without requiring manual configuration on each device. This document covers the four profiles created in this lab: Wi-Fi, VPN, device restrictions and Windows update ring.

---

## Profile 1 - Corporate Wi-Fi

**Location:** Intune admin centre, Devices, Configuration, Corporate Wi-Fi Profile - Lab
**Platform:** Windows 10 and later
**Assigned to:** All Devices

| Setting | Value |
|---|---|
| Wi-Fi type | Enterprise |
| SSID | CorpWireless |
| Connection name | Corporate Wireless Network |
| Connect automatically | Yes |
| Authentication mode | User authentication |
| EAP type | PEAP |

Enterprise Wi-Fi profiles using PEAP authentication are standard in EMEA corporate environments. The profile deploys the wireless configuration to all enrolled devices automatically, removing the need for users to manually enter network credentials.

---

## Profile 2 - Corporate VPN

**Location:** Intune admin centre, Devices, Configuration, Corporate VPN Profile - Lab
**Platform:** Windows 10 and later
**Assigned to:** All Devices

| Setting | Value |
|---|---|
| Scope | User |
| Connection type | Pulse Secure |
| Connection name | Corporate VPN |
| Server address | 10.0.0.1 |
| Authentication method | Username and password |
| Always On | Disable |
| Split tunneling | Disable |

**Note on connection type selection:** IKEv2 and Automatic connection types in Intune require either EAP XML generated from an existing VPN connection or machine certificates from a PKI infrastructure. Neither was available in this lab at this stage. Pulse Secure with username and password authentication was used to demonstrate VPN profile creation and deployment. In a production environment IKEv2 with certificate-based authentication is the recommended configuration for Windows VPN profiles.

---

## Profile 3 - Device Restrictions

**Location:** Intune admin centre, Devices, Configuration, Windows Device Restrictions - Lab
**Platform:** Windows 10 and later
**Assigned to:** All Devices

| Category | Setting | Value |
|---|---|---|
| Password | Require password | Yes |
| Password | Password type | Alphanumeric |
| Password | Minimum password length | 8 characters |
| Password | Minutes of inactivity before screen locks | 15 minutes |
| Password | Password expiration | 90 days |
| Password | Previous passwords to prevent reuse | 5 |
| General | Removable storage | Block |
| General | USB connection | Block |

Blocking removable storage and USB connections is a baseline data loss prevention control required in regulated EMEA environments. Combined with the password requirements, this profile enforces endpoint hardening without requiring additional security tooling.

---

## Profile 4 - Windows Update Ring

**Location:** Intune admin centre, Devices, Update rings for Windows 10 and later, Windows Update Ring - Lab
**Platform:** Windows 10 and later
**Assigned to:** All Devices

| Setting | Value |
|---|---|
| Microsoft product updates | Allow |
| Windows drivers | Allow |
| Quality updates deferral | 5 days |
| Feature updates deferral | 30 days |
| Feature update uninstall period | 10 days |

Quality updates are deferred 5 days to allow Microsoft to identify and pull back problematic patches before they reach production devices. Feature updates are deferred 30 days to allow compatibility testing before rollout. This ring configuration represents a standard Broad ring suitable for the majority of devices in an organisation.

---

## Screenshots
wifi-profile-corporate.png
<img width="1916" height="1073" alt="wifi-profile-corporate" src="https://github.com/user-attachments/assets/3551689e-aac4-44b7-8785-83783d78b88b" />
vpn-profile-corporate.png
<img width="1918" height="1058" alt="vpn-profile-corporate png" src="https://github.com/user-attachments/assets/afd070ca-fdbd-4764-8597-689c2e5f7d6e" />
device-restrictions-profile.png
  <img width="1900" height="1028" alt="device-restrictions-profile" src="https://github.com/user-attachments/assets/f8c3c87c-0230-4f74-b906-f22a67c3d71a" />
windows-update-ring-lab.png
  <img width="1920" height="1007" alt="windows-update-ring-lab" src="https://github.com/user-attachments/assets/e55e5e90-57e2-4333-95c4-67ba784ff806" />
