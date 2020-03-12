control "azure-cis-foundations-6.4" do
  title "Ensure that Network Security Group Flow Log retention period is
'greater than 90 days'"
  desc  "Network Security Group Flow Logs should be enabled and the retention
period is set to greater than or equal to 90 days."
  desc  "rationale", "Flow logs enable capturing information about IP traffic
flowing in and out of network security groups. Logs can be used to check for
anomalies and give insight into suspected breaches."
  desc  "check", "
    **Azure Console**

    1. Go to `Network Watcher`
    2. Select `NSG flow logs` blade in the Logs section
    3. Select each Network Security Group from the list
    4. Ensure `Status` is set to `On`
    5. Ensure `Retention (days)` setting `greater than 90 days`

    **Azure Command Line Interface 2.0**

    ```
    az network watcher flow-log show --resource-group  --nsg  --query
'retentionPolicy'
    ```

    Ensure that `enabled` is set to `true` and `days` is set to `greater then
or equal to 90`.
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Network Watcher`
    2. Select `NSG flow logs` blade in the Logs section
    3. Select each Network Security Group from the list
    4. Ensure `Status` is set to `On`
    5. Ensure `Retention (days)` setting `greater than 90 days`
    6. Select your storage account in the `Storage account` field
    7. Select `Save`

    **Azure Command Line Interface 2.0**

    Enable the `NSG flow logs` and set the Retention (days) to greater than or
equal to 90 days.

    ```
    az network watcher flow-log configure --nsg  --enabled true
--resource-group  --retention 91 --storage-account
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
  tag nist: ["AU-4", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["6.4", "Rev_7"]
  tag cis_rid: "6.4"
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

  describe "This control is not yet implemented. Azure Stack has not yet implemented network watcher." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented network watcher."
  end
end

