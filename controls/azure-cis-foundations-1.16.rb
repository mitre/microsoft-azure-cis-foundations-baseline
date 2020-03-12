control "azure-cis-9.2-control-1.16" do
  title "Ensure that 'Self-service group management enabled' is set to 'No'"
  desc  "Restrict group creation to administrators only."
  desc  "rationale", "Self-service group management enables users to create and
manage security groups or Office 365 groups in Azure Active Directory (Azure
AD). Unless a business requires this day-to-day delegation for some users,
self-service group management should be disabled."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Group settings`
    4. Ensure that `Self-service group management enabled` is set to `No`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Group settings`
    4. Set `Self-service group management enabled` to `No`
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-2", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["16", "Rev_7"]
  tag cis_rid: "1.16"
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

  describe "At this point of time, there is no API/CLI mechanism available to programmatically conduct security assessment for this recommendation." do
    skip "At this point of time, there is no API/CLI mechanism available to programmatically conduct security assessment for this recommendation."
  end
end

