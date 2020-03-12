<<<<<<< HEAD
control "azure-cis-9.2-control-4.1" do
  title "Ensure that 'Auditing' is set to 'On'"
  desc  "Enable auditing on SQL Servers.
=======
control "azure-cis-foundations-4.1" do
  title "Ensure SQL server's TDE protector is encrypted with BYOK (Use your own
key)"
  desc  "TDE with BYOK support provides increased transparency and control over
the TDE Protector, increased security with an HSM-backed external service, and
promotion of separation of duties.

    With TDE, data is encrypted at rest with a symmetric key (called the
database encryption key) stored in the database or data warehouse distribution.
To protect this data encryption key (DEK) in the past, only a certificate that
the Azure SQL Service managed could be used. Now, with BYOK support for TDE,
the DEK can be protected with an asymmetric key that is stored in the Key
Vault. Key Vault is a highly available and scalable cloud-based key store which
offers central key management, leverages FIPS 140-2 Level 2 validated hardware
security modules (HSMs), and allows separation of management of keys and data,
for additional security.

    Based on business needs or criticality of data/databases hosted a SQL
server, it is recommended that the TDE protector is encrypted by a key that is
managed by the data owner (BYOK).
>>>>>>> 9d9783812069bf3301cdb5a6580ba9564cdb02fa
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

