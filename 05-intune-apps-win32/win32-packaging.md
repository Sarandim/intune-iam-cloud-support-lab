# Win32 App Packaging - IntuneWinAppUtil

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 13 May 2026

---

## Purpose

Win32 app packaging converts a standard Windows installer or script into the .intunewin format required by Intune for Win32 app deployment. This enables deployment of any Windows application through Intune with full control over install commands, detection rules, uninstall behaviour and dependency management.

---

## Tool

**Microsoft Win32 Content Prep Tool (IntuneWinAppUtil.exe)**

A command-line utility that compresses and encrypts application source files into a single .intunewin package. The package is then uploaded to Intune and deployed to target devices silently.

Download: `https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool`

---

## Lab Packaging Process

### Source files prepared

Source folder: `C:\AppSource`

Setup file: `install.cmd`

install.cmd content: `echo Installing App > C:\install.log`

### Tool executed

`C:\Tools\IntuneWinAppUtil.exe -c C:\AppSource -s install.cmd -o C:\AppOutput -q`

| Parameter | Value | Meaning |
|---|---|---|
| -c | C:\AppSource | Source folder containing the installer |
| -s | install.cmd | Setup file to package |
| -o | C:\AppOutput | Output folder for the .intunewin file |
| -q | | Quiet mode, no interactive prompts |

### Output produced

Output file: `C:\AppOutput\install.intunewin` (1,457 bytes)

The tool validated parameters, compressed the source folder, encrypted the package, computed SHA256 hashes and generated the Detection.xml metadata file. Output confirmed: File install.intunewin has been generated successfully.

---

## Intune Upload and Configuration

**Location:** Intune admin centre, Apps, All apps, Add, Windows app (Win32)

| Field | Value |
|---|---|
| App package file | install.intunewin |
| Name | Lab Win32 App - Install Script |
| Publisher | Dal Modern Workplace Lab |
| App version | 1.0 |
| Install command | cmd /c install.cmd |
| Uninstall command | cmd /c echo Uninstall |
| Install behaviour | System |
| OS architecture | 64-bit |
| Minimum OS | Windows 10 1607 |
| Detection rule | File exists: C:\install.log |
| Assignment | Required, All Devices |

---

## Detection Rule Logic

The detection rule checks for the presence of `C:\install.log`. This file is created when install.cmd runs successfully on the device. If the file exists Intune marks the app as Installed. If the file is absent Intune marks it as Not installed and retries deployment.

Detection rules are the mechanism Intune uses to determine whether a Win32 app is present on a device. Incorrect detection rules are the most common cause of Win32 deployment failures. See Case 012 for a documented example.

---

## Screenshots

- win32-app-packaging-lab.png

<img width="1808" height="916" alt="win32-app-packaging-lab" src="https://github.com/user-attachments/assets/37d5501a-0653-4467-b893-e2a69c147b7c" />
