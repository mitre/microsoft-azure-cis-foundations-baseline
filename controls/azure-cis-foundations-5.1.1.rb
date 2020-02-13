control "azure-cis-9.2-control-5.1.1" do
  title "Ensure that a Log Profile exists"
  desc  "Enable log profile for exporting activity logs."
  desc  "rationale", "A log profile controls how an activity log is exported.
By default, activity logs are retained only for 90 days. Log profiles should be
defined so that logs can be exported and stored for a longer duration in order
to analyze security activities within an Azure subscription."
  desc  "check", "
    **Azure Console**

    1. Go to `Activity log`
    2. Ensure that a Log Profile is set

    **Azure Command Line Interface 2.0**

    Use the below command to list the Log Profiles and ensure at least one Log
Profile exists.

    ```
    az monitor log-profiles list --query [*].[id,name]
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Activity log`
    2. Click on `Export`
    3. Configure the setting
    4. Click on `Save`

    **Azure Command Line Interface 2.0**

    Use the below command to create a Log Profile in Azure Monitoring.

    ```
    az monitor log-profiles create --categories  --days  --enabled true
--location  --locations  --name
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
  tag nist: ["SI-4 (2)", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["6.5", "Rev_7"]
  tag cis_rid: "5.1.1"
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

