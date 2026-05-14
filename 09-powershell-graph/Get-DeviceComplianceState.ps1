# Get-DeviceComplianceState.ps1
# Lists all Intune-managed devices with compliance state and assigned user
# Use for governance reviews and non-compliant device identification
# Requires: DeviceManagementManagedDevices.Read.All
#
# Usage:
#   Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All"
#   .\Get-DeviceComplianceState.ps1
#
# Lab output (14 May 2026 - DalModernWorkplaceLab):
#   intune-test-dev - compliant - Sarandim - Windows

Get-MgDeviceManagementManagedDevice -All -Property DeviceName,ComplianceState,UserPrincipalName,OperatingSystem |
Select-Object DeviceName, ComplianceState, UserPrincipalName, OperatingSystem |
Format-Table -AutoSize
