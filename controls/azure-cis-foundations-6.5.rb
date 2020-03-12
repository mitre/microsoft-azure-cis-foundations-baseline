control "azure-cis-9.2-control-6.5" do
  title "Ensure that Network Watcher is 'Enabled'"
  desc  "Enable Network Watcher for Azure subscriptions."
  desc  "rationale", "Network diagnostic and visualization tools available with
Network Watcher help users understand, diagnose, and gain insights to the
network in Azure."
  desc  "check", "
    **Azure Console**

    1. Go to `Network Watcher`
    2. Ensure that the `STATUS` is set to `Enabled`

    **Azure Command Line Interface 2.0**

    ```
    az network watcher list
    ```

    Ensure that for all regions, `provisioningState` is set to `Succeeded`.
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Network Watcher`
    2. Right click on the subscription name and click on `Enable network
watcher in all regions`

    **Azure Command Line Interface 2.0**

    Configure the `Network Watcher` for your subscription

    ```
    az network watcher configure --locations  --enabled [true] --resource-group
 --tags key[=value] key[=value]
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
  tag nist: ["CM-8 (6)", "CM-8 (6)", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["11.2", "12.1", "Rev_7"]
  tag cis_rid: "6.5"
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

