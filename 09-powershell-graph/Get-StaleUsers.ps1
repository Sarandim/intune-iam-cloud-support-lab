# Get-StaleUsers.ps1
# Lists all users in the tenant with their last sign-in date
# Sorted oldest to newest to surface inactive accounts first
# Requires: User.Read.All, AuditLog.Read.All
#
# Usage:
#   Connect-MgGraph -Scopes "User.Read.All","AuditLog.Read.All"
#   .\Get-StaleUsers.ps1
#
# Lab output (14 May 2026 - DalModernWorkplaceLab):
#   James Lebron  - never signed in
#   Maria Costa   - 08/05/2026
#   Alex Turner   - 12/05/2026
#   Sarandim      - 13/05/2026

Get-MgUser -All -Property DisplayName,UserPrincipalName,SignInActivity |
Select-Object DisplayName, UserPrincipalName,
@{N="LastSignIn";E={$_.SignInActivity.LastSignInDateTime}} |
Sort-Object LastSignIn |
Format-Table -AutoSize
