control "azure-cis-9.2-control-1.20" do
  title "Ensure that 'Users who can manage Office 365 groups' is set to 'None'"
  desc  "Restrict Office 365 group management to administrators only."
  desc  "rationale", "Restricting Office 365 group management to administrators
prohibits users from making changes to Office 365 groups. This ensures that
Office 365 groups are appropriately managed and their management is not
delegated to any other user."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Group settings`
    4. Ensure that `Users who can manage Office 365 groups` is set to `None`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Group settings`
    4. Set `Users who can manage Office 365 groups` to `None`
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
  tag cis_rid: "1.20"
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

