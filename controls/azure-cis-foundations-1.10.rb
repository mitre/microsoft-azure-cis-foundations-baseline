control "azure-cis-9.2-control-1.10" do
  title "Ensure that 'Users can add gallery apps to their Access Panel' is set
to 'No'"
  desc  "Require administrators to provide consent for the apps before use."
  desc  "rationale", "Unless Azure Active Directory is running as an identity
provider for third-party applications, do not allow users to use their identity
outside of your cloud environment. User profiles contain private information
such as phone numbers and email addresses which could then be sold off to other
third parties without requiring any further consent from the user."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `User settings`
    4. Ensure that `Users can add gallery apps to their Access Panel` is set to
`No`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `User settings`
    4. Set `Users can add gallery apps to their Access Panel` to `No`
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SC-32", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["2", "Rev_7"]
  tag cis_rid: "1.10"
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

