control "azure-cis-foundations-5.1.4" do
  title "Ensure the log profile captures activity logs for all regions
including global"
  desc  "Configure the log profile to export activities from all Azure
supported regions/locations including global."
  desc  "rationale", "
    A log profile controls how the activity Log is exported.

    Ensuring that logs are exported from all the Azure supported
regions/locations means that logs for potentially unexpected activities
occurring in otherwise unused regions are stored and made available for
incident response and investigations.

    Including global region/location in the log profile locations ensures all
events from the control/management plane will be exported, as many events in
the activity log are global events.
  "
  desc  "check", "
    **Azure Console**

    1. Go to `Activity log`
    2. Select `Export`
    3. Select `Subscription`
    4. Click `Regions` dropdown and ensure `Select all` is checked

    **Azure Command Line Interface 2.0**

    1. Count all azure supported regions:

    ```
    az account list-locations --query [*].displayName | grep -P '\\w+' | wc -l
    ```

    2. Ensure the all azure supported regions are covered along with additional
global region:

    ```
    az monitor log-profiles list --query [*].locations | grep -P '\\w+' | wc -l
    ```
    This gives count which should be +1 (for global region) than count in
command output 1
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Activity log`
    2. Select `Export`
    3. Select `Subscription`
    4. In `Regions` dropdown list, check `Select all`
    5. Select `Save`

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
  tag cis_rid: "5.1.4"
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

