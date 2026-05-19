## Security Copilot Operations and Verification Manual

This document details the operational prompt architecture for Microsoft Security Copilot within identity and endpoint management environments. Every prompt is structured to extract high-fidelity diagnostic data, followed by the explicit manual validation paths required to verify the integrity of the system-generated output.

## Operational Prompts

## Prompt 01 Compliance Failure Diagnostics
Summarise the primary configuration errors causing the non-compliant status of the device, detailing which specific setting failed the last evaluation ring and when the policy checked in.

## Prompt 02 Entra ID Sign-In Analysis
Generate a Kusto Query Language query targeting the sign-in logs from the past twenty-four hours to isolate failed authentication attempts where the error code indicates a Conditional Access block or an invalid multi-factor authentication response, grouping the results by user principal name and source IP address.

## Prompt 03 Conditional Access Policy Analysis
Evaluate the configuration of the targeted Conditional Access policy and outline its potential blast radius across the tenant, noting any misconfigurations where a lack of explicit group exclusion could accidentally lock out administrative accounts.

## Prompt 04 Endpoint Remediation Playbook
Produce a structured remediation sequence for a Windows endpoint flagged as non-compliant due to missing BitLocker drive encryption and disabled Microsoft Defender real-time protection, incorporating the required PowerShell commands to trigger an immediate device sync.

## Human Verification Framework

System-generated data from Security Copilot requires manual verification within the native administrative interfaces to guarantee accuracy before taking administrative action or updating support cases.

## Endpoint Compliance Validation
1. Open the Microsoft Intune admin center at ://microsoft.com.
2. Navigate to Devices, select All devices, and locate the affected endpoint.
3. Click Device compliance to review the policy assignment.
4. Select the specific non-compliant policy to view the setting-level status, verifying the precise configuration value that triggered the failure signal.

## Identity Authentication Auditing
1. Open the Microsoft Entra admin center at ://microsoft.com.
2. Navigate to Identity, select Monitoring & health, and click Sign-in logs.
3. Apply filters for User principal name and Status to locate the failed authentication attempt.
4. Click the targeted log entry and select the Conditional Access tab to review which policies evaluated as success, failure, or not applied, cross-referencing the result with the query output.

## Security Baseline Verification
1. Open the Microsoft Intune admin center at ://microsoft.com.
2. Navigate to Endpoint security, select Security baselines, and review the Windows security baseline deployment.
3. Select Device status to isolate endpoints failing the baseline settings.
4. Cross-reference individual device settings against local Event Viewer logs at Applications and Services Logs > Microsoft > Windows > DeviceManagement-Enterprise-Diagnostics-Provider > Admin to confirm policy delivery status.
