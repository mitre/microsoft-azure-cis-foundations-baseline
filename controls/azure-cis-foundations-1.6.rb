control "azure-cis-9.2-control-1.6" do
  title "Ensure that 'Number of days before users are asked to re-confirm their
authentication information' is not set to \"0\""
  desc  "Ensure that the number of days before users are asked to re-confirm
their authentication information is not set to 0."
  desc  "rationale", "If authentication re-confirmation is disabled, registered
users will never be prompted to re-confirm their existing authentication
information. If the authentication information for a user, such as a phone
number or email changes, then the password reset information for that user
reverts to the previously registered authentication information."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Password reset`
    4. Go to `Registration`
    5. Ensure that `Number of days before users are asked to re-confirm their
authentication information` is not set to `0`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Password reset`
    4. Go to `Registration`
    5. Set the `Number of days before users are asked to re-confirm their
authentication information` to your organization defined frequency
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-2", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["16", "Rev_7"]
  tag cis_rid: "1.6"
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

