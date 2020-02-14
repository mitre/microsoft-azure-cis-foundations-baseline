control "azure-cis-foundations-6.3" do
  title "Ensure no SQL Databases allow ingress 0.0.0.0/0 (ANY IP)"
  desc  "Ensure that no SQL Databases allow ingress from 0.0.0.0/0 (ANY IP)."
  desc  "rationale", "
    SQL Server includes a firewall to block access to unauthorized connections.
More granular IP addresses can be defined by referencing the range of addresses
available from specific datacenters.

    By default, for a SQL server, a Firewall exists with StartIp of 0.0.0.0 and
EndIP of 0.0.0.0 allowing access to all the Azure services.

    Additionally, a custom rule can be set up with StartIp of 0.0.0.0 and EndIP
of 255.255.255.255 allowing access from ANY IP over the Internet.

    In order to reduce the potential attack surface for a SQL server, firewall
rules should be defined with more granular IP addresses by referencing the
range of addresses available from specific datacenters.
  "
  desc  "check", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each SQL server
    3. Click on `Firewall / Virtual Networks`
    4. Ensure that `Allow access to Azure services` to set to `OFF`
    5. Ensure that no firewall rule exists with
     - Start IP of `0.0.0.0`
     - or other combinations which allows access to wider public IP ranges

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```
    Get-AzureRmSqlServer
    ```

    For each Server

    ```
    Get-AzureRmSqlServerFirewallRule -ResourceGroupName  -ServerName
    ```

    Ensure that `StartIpAddress` is not set to `0.0.0.0` or other combinations
which allows access to wider public IP ranges including Windows Azure IP ranges.
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each SQL server
    3. Click on `Firewall / Virtual Networks`
    4. Set `Allow access to Azure services` to `OFF'
    5. Set firewall rules to limit access to only authorized connections

    **Azure PowerShell**

    Disable Default Firewall Rule `Allow access to Azure services` :

    ```Remove-AzureRmSqlServerFirewallRule -FirewallRuleName
\"AllowAllWindowsAzureIps\" -ResourceGroupName  -ServerName ```

    Remove custom Firewall rule:
    ```Remove-AzureRmSqlServerFirewallRule -FirewallRuleName \"\"
-ResourceGroupName  -ServerName ```

    Set the appropriate firewall rules:

    ```
    Set-AzureRmSqlServerFirewallRule -ResourceGroupName  -ServerName
-FirewallRuleName \"\" -StartIpAddress \"\" -EndIpAddress \"\"
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
  tag nist: ["SC-7 (8)", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["12", "Rev_7"]
  tag cis_rid: "6.3"
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

