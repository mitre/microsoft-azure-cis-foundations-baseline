control "azure-cis-9.2-control-4.2" do
  title "Ensure that 'AuditActionGroups' in 'auditing' policy for a SQL server
is set properly"
  desc  "Configure the 'AuditActionGroups' property to appropriate groups to
capture all the critical activities on the SQL Server and all the
    SQL databases hosted on the SQL server.
  "
  desc  "rationale", "
    To capture all critical activities done on SQL Servers and databases within
sql servers, auditing should be configured to capture appropriate
'AuditActionGroups'.
    Property `AuditActionGroup` should contains at least
`SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP,
FAILED_DATABASE_AUTHENTICATION_GROUP, BATCH_COMPLETED_GROUP` to ensure
comprehensive audit logging for SQL servers and SQL databases hosted on SQL
Server.
  "
  desc  "check", "
    **Azure Console**

    On Azure Console, There is no provision to check or change
`AuditActionGroup` property.

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```Get-AzureRmSqlServer```

    For each Server

    ```Get-AzureRmSqlServerAuditing -ResourceGroupName  -ServerName  ```

    Ensure that `AuditActionGroup` contains all of
`SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP,
FAILED_DATABASE_AUTHENTICATION_GROUP, BATCH_COMPLETED_GROUP` .
  "
  desc  "fix", "
    **Azure Console**

    On Azure Console, There is no Provision to check or change
`AuditActionGroup` property.

    **Azure PowerShell**

    To create Audit profile with prescribed 'AuditActionGroup':

    ```
    Set-AzureRmSqlServerAuditingPolicy -ResourceGroupName \"\" -ServerName \"\"
-StorageAccountName \"storageAccountName\" -AuditActionGroup
\"SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP\",
\"FAILED_DATABASE_AUTHENTICATION_GROUP\" -RetentionInDays = 90>
    ```
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AU-3", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["6.3", "Rev_7"]
  tag cis_rid: "4.2"
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: nil
  tag mitigations: nil
  tag severity_override_guidance: nil
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: nil
end

