control "azure-cis-foundations-4.3" do
  title "Ensure that 'Auditing' Retention is 'greater than 90 days'"
  desc  "SQL Server Audit Retention should be configured to be greater than 90
days."
  desc  "rationale", "Audit Logs can be used to check for anomalies and give
insight into suspected breaches or misuse of information and access."
  desc  "check", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Auditing`
    4. Select `Storage Details`
    5. Ensure `Retention (days)` setting `greater than 90 days`

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```
    Get-AzureRmSqlServer
    ```

    For each Server

    ```
    Get-AzureRmSqlServerAuditing -ResourceGroupName  -ServerName
    ```

    Ensure that `RetentionInDays` is set to `more than or equal to 90`
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Auditing`
    4. Select `Storage Details`
    5. Set `Retention (days)` setting `greater than 90 days`
    6. Select `OK`
    7. Select `Save`

    **Azure PowerShell**

    For each Server, set retention policy for more than or equal to 90 days

    ```
    set-AzureRmSqlServerAuditing -ResourceGroupName  -ServerName
-RetentionInDays
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
  tag nist: ["AU-4", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["6.4", "Rev_7"]
  tag cis_rid: "4.3"
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

