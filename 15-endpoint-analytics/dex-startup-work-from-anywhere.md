## Overview
Endpoint Analytics is a Microsoft Intune feature that collects telemetry from managed Windows devices and translates device performance data into actionable metrics for IT operations teams. Digital Employee Experience scoring surfaces the business impact of device health issues before users raise helpdesk tickets.

This document covers the primary Endpoint Analytics metric categories, their operational interpretation, and how they translate into business impact language for IT leadership and service desk teams managing remote workforces.

## Business Impact Statement

Remote workers have no physical IT presence to escalate to when a device performs poorly. Endpoint Analytics makes invisible productivity loss visible and measurable before it becomes a support volume problem. In EMEA remote-first environments where IT cannot physically reach devices across multiple countries, this is how a support engineer demonstrates proactive device management rather than reactive firefighting.

## Lab Observations

Endpoint Analytics was accessed directly in this tenant under Reports, Endpoint Analytics. The Work From Anywhere report returned real telemetry data for the two enrolled devices, intune-test-dev and win11-hotpatch-lab. Four insights were surfaced by the report.

| Insight | Recommended Action | Score Impact |
|---|---|---|
| 100% of devices are not hybrid joined to Entra ID | Enable Entra hybrid join | +31 points |
| 100% of devices do not meet the Windows version baseline criteria | Upgrade to a supported Windows version meeting the analytics baseline | +31 points |
| 100% of Windows devices not registered for Autopilot | Register devices in Autopilot | +3 points |
| 100% of Windows devices have no Autopilot deployment profile | Create and assign a deployment profile | +3 points |

The Windows version finding reflects how the Endpoint Analytics engine evaluates devices against its internal baseline criteria, not that the enrolled devices are running unsupported Windows versions. Both enrolled devices are running supported Windows versions as documented in earlier lab sessions. In a production environment these four insights would form the basis of a device readiness assessment for remote work capability. Startup Performance data was not available at the time of this lab session due to insufficient telemetry from recently enrolled devices.

## Startup Performance

Startup performance measures the time from device power-on to a fully usable desktop state, broken into four components.

| Component | Description | Business Impact |
|---|---|---|
| Group Policy processing time | Time taken to apply configuration policies at sign-in | Extended processing delays user access to applications at the start of each working day |
| Sign-in time | Time from credential entry to desktop ready state | Direct measure of user-perceived startup experience |
| Core boot time | Time from power-on to Windows sign-in screen | Hardware or OS-level indicator, flags ageing device population |
| Time to responsive desktop | Time until device CPU settles below threshold after sign-in | Indicates background process contention affecting early-session usability |

A device scoring below the baseline in startup performance is a candidate for hardware refresh assessment, update ring adjustment, or startup application review.

## Application Reliability

| Metric | Description | Operational Response |
|---|---|---|
| Mean time to failure | Average session duration before an application crash occurs | Low scores indicate application compatibility or update issues requiring investigation |
| Crash frequency by application | Ranked list of applications by crash event count | Prioritises remediation effort toward highest-impact applications |
| Device crash score | Aggregate reliability score per device | Flags individual devices requiring OS reinstall or hardware investigation |

## Work From Anywhere Score

| Component | Description |
|---|---|
| Cloud identity | Device uses Entra ID authentication rather than on-premises domain authentication |
| Cloud management | Device is managed by Intune rather than requiring on-premises domain connectivity |
| Cloud provisioning | Device can be provisioned remotely via Autopilot without physical IT intervention |
| Conditional Access | Device passes Conditional Access compliance requirements without network dependency |

A high Work From Anywhere score indicates the device and identity configuration is genuinely remote-work capable. A low score identifies dependencies on on-premises infrastructure that will cause access failures when users work outside the corporate network.

## Translating Metrics into Business Language

| Finding | Business Impact |
|---|---|
| Average startup time above 120 seconds across a device population | Users lose measurable productive time at the start of each working day |
| Application crash rate spike following OS update deployment | Update has introduced instability, requiring rollback assessment and increased helpdesk contact volume |
| Work From Anywhere score below baseline | Device population has unresolved on-premises dependencies causing access failures in remote work scenarios |
| Core boot time outliers in devices over three years old | Ageing hardware population informing the device refresh prioritisation cycle |

## Operational Use in Support Cases

Before contacting an affected user about a performance complaint, the support engineer reviews the device score in Endpoint Analytics to determine whether the issue is isolated to a single device or part of a wider pattern. A single-device outlier points toward hardware or local configuration. A group-wide pattern points toward a policy, update, or application deployment change.

## Screenshots

- endpoint-analytics-wfa-score.png
  <img width="1907" height="982" alt="endpoint-analytics-wfa-score" src="https://github.com/user-attachments/assets/02908291-9a92-4bb7-8d6b-70bd24ce4b26" />

- endpoint-analytics-wfa-insights.png
  <img width="1900" height="1008" alt="endpoint-analytics-wfa-insights" src="https://github.com/user-attachments/assets/432f42ec-70f7-4c6d-a19d-694eac4f65b3" />
