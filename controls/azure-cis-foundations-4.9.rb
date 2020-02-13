control "azure-cis-9.2-control-4.9" do
  title "Ensure that 'Data encryption' is set to 'On' on a SQL Database"
  desc  "Enable Transparent Data Encryption on every SQL server."
  desc  "rationale", "Azure SQL Database transparent data encryption helps
protect against the threat of malicious activity by performing real-time
encryption and decryption of the database, associated backups, and transaction
log files at rest without requiring changes to the application."
  desc  "check", "
    **Azure Console**

    1. Go to `SQL databases`
    2. For each DB instance
    3. Click on `Transparent data encryption`
    4. Ensure that `Data encryption` is set to `On`

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command is `Enabled`

    ```
    az sql db tde show --resource-group  --server  --database  --query status
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `SQL databases`
    2. For each DB instance
    3. Click on `Transparent data encryption`
    4. Set `Data encryption` to `On`

    **Azure Command Line Interface 2.0**

    Use the below command to enable `Transparent data encryption` for SQL DB
instance.

    ```
    az sql db tde set --resource-group  --server  --database  --status Enabled
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
  tag nist: ["SC-28", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["14.8", "Rev_7"]
  tag cis_rid: "4.9"
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

