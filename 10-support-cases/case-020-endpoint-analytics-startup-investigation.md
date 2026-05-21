**Title:** Slow startup investigation on managed Windows 11 device via Endpoint Analytics
**Case:** 020
**Date:** 20 May 2026
**Reported by:** Alex Turner
**Affected user:** Alex Turner, alex.turner@DalModernWorkplaceLab.onmicrosoft.com
**Affected CI:** win11-hotpatch-lab
**Priority:** P3 - Single user affected, device startup performance below acceptable baseline.
**Urgency:** Normal
**Impact:** User reports the device takes an excessive amount of time to reach a usable desktop state after sign-in, reducing productive time at the start of each working session.
**Assignment group:** Endpoint Operations

## Summary

The user reported that win11-hotpatch-lab was taking significantly longer than expected to reach a usable desktop state after sign-in. Investigation used Endpoint Analytics to review startup performance and Work From Anywhere readiness data for the affected device. Startup performance telemetry was not yet available due to recent device enrolment. The Work From Anywhere report returned real data identifying four configuration insights relevant to remote work readiness.

## Investigation Steps

1. Navigated to intune.microsoft.com, Reports, Endpoint Analytics, Startup performance. Located win11-hotpatch-lab in the device list. Confirmed startup performance data was not yet available due to insufficient telemetry from recently enrolled devices. This is the expected state within the first days of device enrolment and does not indicate a reporting failure.

2. Navigated to Work from anywhere under Endpoint Analytics. Confirmed real telemetry data was available for the enrolled devices. Reviewed the four capability scores: Windows, Cloud identity, Cloud management, and Cloud provisioning.

3. The report surfaced four insights for the enrolled device population. Devices are not hybrid joined to Entra ID, devices do not meet the Windows version baseline criteria used by the analytics engine, no devices are registered for Autopilot, and no Autopilot deployment profile is assigned. Each finding is consistent with a lab environment using Azure VMs and does not represent a production misconfiguration.

4. Reviewed device compliance state in Intune. Confirmed win11-hotpatch-lab compliance status as compliant with all assigned compliance policies passing.

5. Reviewed assigned configuration profiles for win11-hotpatch-lab. Confirmed Hotpatch-Ring-Win11-Lab and Hotpatch-Enable-Win11-Lab are both applied and reporting Succeeded, confirming no policy conflict is contributing to the reported startup behaviour.

6. Noted that startup performance telemetry will become available after several days of device operation. Scheduled a follow-up review of the Startup performance report within five working days.

## Resolution Steps

1. Confirmed no active policy conflict or compliance failure was contributing to the reported startup delay at the time of investigation.

2. Advised the user that the device had been recently enrolled and startup performance data collection was in progress. Recommended allowing one to two working days for telemetry to populate before escalating further.

3. Documented the Work From Anywhere findings as a reference baseline for the device. The four insights will be actioned as part of the broader device estate review, not as an immediate response to the startup complaint.

4. Scheduled a follow-up review of the Startup performance report for win11-hotpatch-lab within five working days to confirm whether telemetry is available and whether any startup component scores below the tenant baseline.

## Root Cause

Startup performance telemetry was not available at the time of investigation due to the device having been recently enrolled in Intune. Endpoint Analytics requires several days of device operation to generate reliable startup scores. No active policy conflict, compliance failure, or configuration error was identified as contributing to the reported startup behaviour at the time of investigation.

## Prevention

Endpoint Analytics startup performance reports must be reviewed monthly to identify devices scoring below the tenant baseline before users raise helpdesk tickets. New devices must be allowed a minimum of five working days post-enrolment before startup performance data is considered reliable for investigation purposes. Work From Anywhere scores must be reviewed as part of device onboarding sign-off to confirm remote work readiness before the device is issued to the end user.

## Customer Update

Dear Alex Turner,

The investigation into your device startup issue has been completed. No active configuration fault was identified at this time. Performance data collection is in progress following your recent device enrolment, and a follow-up review has been scheduled within five working days. Please contact the service desk if the startup delay worsens before then.

## Screenshots

- endpoint-analytics-wfa-score.png
  <img width="1907" height="982" alt="endpoint-analytics-wfa-score" src="https://github.com/user-attachments/assets/77714c36-5558-456c-a15d-418af4e67e28" />

- endpoint-analytics-wfa-insights.png
  <img width="1900" height="1008" alt="endpoint-analytics-wfa-insights" src="https://github.com/user-attachments/assets/8d2e5f09-17d8-42c7-bd69-a6b28dec3275" />
