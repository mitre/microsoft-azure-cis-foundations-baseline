control "azure-cis-9.2-control-4.1" do
  title "Ensure that 'Auditing' is set to 'On'"
  desc  "Enable auditing on SQL Servers.
  "
  desc  "rationale", "The Azure platform allows a SQL server to be created as a service. Enabling auditing at the server level ensures that all existing and newly created databases on the SQL server instance are audited. Auditing policy applied on the SQL database does not override auditing policy and settings applied on the particular SQL server where the database is hosted.
  Auditing tracks database events and writes them to an audit log in the Azure storage account. It also helps to maintain regulatory compliance, understand database activity, and gain insight into discrepancies and anomalies that could indicate business concerns or suspected security violations."
  desc  "check", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Auditing`
    4. Ensure that `Auditing` is set to `On`

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```Get-AzureRmSqlServer```

    For each Server

    ```Get-AzureRmSqlServerAuditing -ResourceGroupName  -ServerName  ```

    Ensure that `AuditState` is set to `Enabled`
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Auditing`
    4. Set `Auditing` to `On`

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```Get-AzureRmSqlServer```

    For each Server, enable auditing.

    ```
    Set-AzureRmSqlServerAuditingPolicy -ResourceGroupName <resource group name> - ServerName <server name> -AuditType <audit type> -StorageAccountName <storage account name>
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
  tag cis_rid: "4.1"
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

  describe "This control is not yet implemented. Azure Stack has not yet implemented sql databases as a service." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented sql databases as a service."
  end
end

