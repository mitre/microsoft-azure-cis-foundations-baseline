control "azure-cis-9.2-control-5.1.3" do
  title "Ensure audit profile captures all the activities"
  desc  "The log profile should be configured to export all activities from the
control/management plane."
  desc  "rationale", "A log profile controls how the activity log is exported.
Configuring the log profile to collect logs for the categories \"write\",
\"delete\" and \"action\" ensures that all the control/management plane
activities performed on the subscription are exported."
  desc  "check", "
    **Azure Console**
    On the Azure Portal there is no provision to check or set categories.
However, when a log profile is created using the Azure Portal, `Write, Delete
and Action` categories are set by default.

    **Azure Command Line Interface 2.0**

    Ensure the categories set to `Write, Delete and Action`:

    ```
    az monitor log-profiles list --query [*].categories
    ```
  "
  desc  "fix", "
    **Azure Console**
    On Azure portal there is no provision to check or set categories.

    **Azure Command Line Interface 2.0**

    Use command: `az monitor log-profiles update --name default` in order to
update existing default log profile.

    Please refer to the documentation:
`https://docs.microsoft.com/en-us/cli/azure/monitor/log-profiles?view=azure-cli-latest#az-monitor-log-profiles-update`
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
  tag cis_rid: "5.1.3"
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

  describe "This control is not yet implemented. Azure Stack has not yet implemented exporting activity logs from azure stack." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented exporting activity logs from azure stack."
  end
end

