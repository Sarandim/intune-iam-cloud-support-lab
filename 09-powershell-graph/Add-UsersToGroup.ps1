# Add-UsersToGroup.ps1
# Adds a user to a specified group by display name
# Extend by replacing single user lookup with a CSV loop for bulk operations
# Requires: Group.ReadWrite.All
#
# Usage:
#   Connect-MgGraph -Scopes "Group.ReadWrite.All"
#   .\Add-UsersToGroup.ps1
#
# Expected API response if user is already a member:
#   "One or more added object references already exist for the following
#    modified properties: 'members'."
#   This is expected behaviour, not a script failure.
#
# Lab output (14 May 2026 - DalModernWorkplaceLab):
#   James Lebron already a member of IT Support Staff - API confirmed existing membership

$groupId = (Get-MgGroup -Filter "displayName eq 'IT Support Staff'").Id
New-MgGroupMember -GroupId $groupId -DirectoryObjectId (Get-MgUser -Filter "displayName eq 'James Lebron'").Id
Write-Output "James Lebron added to IT Support Staff"
