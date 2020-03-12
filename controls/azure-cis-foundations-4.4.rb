control "azure-cis-foundations-4.4" do
  title "Ensure that 'Advanced Data Security' on a SQL server is set to 'On'"
  desc  "Enable \"Advanced Data Security\" on critical SQL Servers."
  desc  "rationale", "
    SQL Server \"Advanced Data Security\" provides a new layer of security,
which enables customers to detect and respond to potential threats as they
occur by providing security alerts on anomalous activities. Users will receive
an alert upon suspicious database activities, potential vulnerabilities, and
SQL injection attacks, as well as anomalous database access patterns. SQL
Server Threat Detection alerts provide details of suspicious activity and
recommend action on how to investigate and mitigate the threat.
    Additionally, SQL server Advanced Data Security includes functionality for
discovering and classifying sensitive data.

    Advanced Data Security is a paid feature. It is recommended to enable the
feature at least on business-critical SQL Servers.
  "
  desc  "check", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Advanced Data Security`
    4. Ensure that `Advanced Data Security` is set to `On`

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```
    Get-AzureRmSqlServer
    ```

    For each Server

    ```
    Get-AzureRmSqlServerThreatDetectionPolicy -ResourceGroupName  -ServerName
    ```

    Ensure that `ThreatDetectionState` is set to `Enabled`.
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Advanced Data Security`
    4. Set `Advanced Data Security` to `On`

    **Azure PowerShell**

    Enable `Advanced Data Security` for a SQL Server:

    ```
    Set-AzureRmSqlServerThreatDetectionPolicy -ResourceGroupName  -ServerName
-EmailAdmins $True
    ```

    Note:
    - Enabling 'Advanced Data Security' from the Azure portal enables `Threat
Detection`
    - Using Powershell command `Set-AzureRmSqlServerThreatDetectionPolicy`
enables `Advanced Data Security` for a SQL server
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["RA-5", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["3.1", "Rev_7"]
  tag cis_rid: "4.4"
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

