control "azure-cis-foundations-1.19" do
  title "Ensure that 'Users can create Office 365 groups' is set to 'No'"
  desc  "Restrict Office 365 group creation to administrators only."
  desc  "rationale", "Restricting Office 365 group creation to administrators
only ensures that creation of Office 365 groups is controlled by the
administrator. Appropriate groups should be created and managed by the
administrator and group creation rights should not be delegated to any other
user."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Group settings`
    4. Ensure that `Users can create Office 365 groups` is set to `No`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Group settings`
    4. Set `Users can create Office 365 groups` to `No`
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
  tag cis_rid: "1.19"
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

