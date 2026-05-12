# Intune Enrolment Baseline

## Overview
This document covers the Intune enrolment baseline configuration completed 
on Day 6 of the lab. A Windows 11 virtual machine was enrolled into Microsoft 
Intune via Entra ID join, with automatic MDM enrolment enabled at tenant level.

## Enrolment Configuration

| Setting | Value |
|---------|-------|
| MDM user scope | All users |
| Enrolment method | Entra ID join with automatic MDM enrolment |
| Device platform restriction | Windows MDM allowed, default policy |
| Ownership classification | Corporate |

## Device Enrolled

| Field | Value |
|-------|-------|
| Device name | intune-test-device |
| Operating system | Windows 11 Pro |
| OS version | 10.0.26100.2605 |
| Managed by | Microsoft Intune |
| Ownership | Corporate |
| Compliance state | Compliant |
| Primary user | sarandim@DalModernWorkplaceLab.onmicrosoft.com |
| Enrolment date | 12 May 2026 |

## Enrolment Method

The device was joined to Entra ID via Settings, Accounts, Access work or 
school, Join this device to Microsoft Entra ID. Automatic MDM enrolment 
triggered immediately following Entra join, requiring no additional 
configuration on the device.

## Screenshots
- intune-enrolment-success.png
- intune-enrolment-device-joined.png
