# App Deployment Basics - Microsoft 365 Apps and Store Apps

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 13 May 2026

---

## Purpose

This document covers the two foundational app deployment methods in Intune: deploying Microsoft 365 Apps as a suite and deploying a store app through the Microsoft Store app (new) connector. Both methods push applications to enrolled devices without requiring manual installation on each endpoint.

---

## Deployment 1 - Microsoft 365 Apps for Windows 10 and later

**Location:** Intune admin centre, Apps, All apps, Microsoft 365 Apps for Windows 10 and later
**Assigned to:** All Devices

### Configuration

| Setting | Value |
|---|---|
| Architecture | 64-bit |
| Default file format | Office Open XML Format |
| Update channel | Monthly Enterprise Channel |
| Remove other versions | Yes |
| Version to install | Latest |
| Accept licence terms on behalf of users | Yes |

### Why These Settings

64-bit is the standard architecture for modern Windows deployments. Monthly Enterprise Channel receives updates once a month on a predictable schedule, which is the standard choice for organisations that need stability without falling behind on security patches. Removing other versions prevents conflicts with pre-existing Office installations on devices. Accepting licence terms on behalf of users removes the licence prompt during installation, which is required for silent deployment.

---

## Deployment 2 - Company Portal (Microsoft Store)

**Location:** Intune admin centre, Apps, All apps, Company Portal
**App type:** Microsoft Store app (new)
**Install behaviour:** System
**Assigned to:** All Devices

Company Portal is the end-user facing application that shows device compliance status, available apps and last sync time. Deploying it through Intune as a store app ensures it is present on all enrolled devices without requiring users to find and install it manually from the Microsoft Store.

---

## How App Deployment Works in Intune

When an app is assigned to a group or All Devices, Intune signals the device at the next check-in cycle. The Intune Management Extension on the device processes the installation request and reports the result back to the admin centre. The deployment status per device is visible in the app record under Device install status.

For Microsoft 365 Apps, the Office Deployment Tool handles the installation in the background. For store apps, the Microsoft Store connector handles the download and installation.

---

## Screenshots

- m365-apps-deployment.png
  <img width="1909" height="1055" alt="m365-apps-deployment" src="https://github.com/user-attachments/assets/664f14b4-8b24-4c38-95c1-5981929f1413" />

- company-portal-store-app.png
  <img width="1915" height="929" alt="company-portal-store-app" src="https://github.com/user-attachments/assets/c81938c0-a0cc-438f-bbc2-340b1f1e02d7" />
