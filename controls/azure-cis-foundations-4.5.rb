control "azure-cis-foundations-4.5" do
  title "Ensure that 'Threat Detection types' is set to 'All'"
  desc  "Enable all types of threat detection on SQL servers."
  desc  "rationale", "Enabling all threat detection types protects against SQL
injection, database vulnerabilities, and any other anomalous activities."
  desc  "check", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Advanced Data Security`
    4. At section Threat Detection Settings, Ensure that `Threat Detection
Types` is set to `All`

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```
    Get-AzureRmSqlServer
    ```

    For each Server

    ```
    Get-AzureRmSqlServerThreatDetectionPolicy -ResourceGroupName  -ServerName
    ```

    Ensure that `ExcludedDetectionTypes` is set to `{}` i.e.. None.
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Advanced Data Security`
    4. At section Threat Detection Settings, Set `Threat Detection types` to
`All`

    **Azure PowerShell**

    For each Server, set `ExcludedDetectionTypes` to None:

    ```
    Set-AzureRmSqlServerThreatDetectionPolicy -ResourceGroupName  -ServerName
-ExcludedDetectionType \"None\"
    ```
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
  tag cis_rid: "4.5"
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

