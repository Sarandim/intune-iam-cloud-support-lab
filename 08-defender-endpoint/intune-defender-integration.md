# Microsoft Defender for Endpoint Integration with Intune

**Lab environment:** DalModernWorkplaceLab.onmicrosoft.com
**Date:** 14 May 2026

---

## Purpose

Microsoft Defender for Endpoint and Microsoft Intune integration creates a security control chain where device threat signals from Defender feed directly into Intune compliance evaluation and Entra ID Conditional Access enforcement. A device with an elevated Defender risk score is automatically blocked from accessing corporate resources until the threat is remediated.

---

## Connection Setup

The integration requires configuration in both portals.

### Step 1 - Enable connection in Defender portal

**Location:** security.microsoft.com, Settings, Endpoints, Advanced features

Microsoft Intune connection set to On. This allows Defender to share device risk signals with Intune and enables Intune to push endpoint security policies to Defender-onboarded devices.

### Step 2 - Enable connection in Intune

**Location:** intune.microsoft.com, Endpoint security, Microsoft Defender for Endpoint

Connection status confirmed as Enabled. Last synchronised 14/05/2026 22:42. Windows devices version 10.0.15063 and above connected to Defender for Endpoint set to On.

---

## How the Integration Works

Defender for Endpoint continuously monitors enrolled devices for threats. When a threat is detected the device is assigned a risk score: Clean, Low, Medium or High. This risk score is sent to Intune via the established connection. Intune evaluates the risk score as part of the device compliance assessment. A Conditional Access policy configured to require compliant devices will then block access if the device risk score exceeds the configured threshold.

The full chain:

Defender detects threat on device, risk score assigned and sent to Intune, Intune marks device as non-compliant based on risk threshold, Entra ID Conditional Access evaluates compliance signal, user blocked from corporate resources until device risk score returns to acceptable level.

---

## Compliance Policy Integration

To enforce risk-based access control the Windows compliance policy must include a Defender for Endpoint risk score threshold configured in Intune under the compliance policy Device Health section.

| Risk score threshold | Devices blocked |
|---|---|
| Clear | Only devices with active threats blocked |
| Low | Devices with low, medium or high risk blocked |
| Medium | Devices with medium or high risk blocked |
| High | Only devices with high risk blocked |

In a production environment the threshold is set based on the organisation's risk tolerance. Most regulated EMEA environments use Medium as the threshold, blocking any device with an elevated risk score from accessing corporate resources automatically.

---

## Onboarding Devices to Defender

Once the Intune connection is established, Windows devices enrolled in Intune can be onboarded to Defender for Endpoint automatically using an endpoint detection and response configuration profile in Intune. The profile deploys the Defender onboarding package to all assigned devices silently.

**Location:** Intune admin centre, Endpoint security, Endpoint detection and response, Create policy

The onboarding profile deployment is the next step to complete the full integration. Once deployed all enrolled Windows devices will be onboarded to Defender automatically without user intervention.

---

## Screenshots

- defender-intune-connection.png
<img width="1678" height="977" alt="defender-intune-connection" src="https://github.com/user-attachments/assets/11684836-3783-4af9-888a-5c2b3b5158d0" />

- intune-defender-connection.png
  <img width="1659" height="571" alt="intune-defender-connection" src="https://github.com/user-attachments/assets/087c2861-3d38-4ed7-94aa-e70df5396beb" />
