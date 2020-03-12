control "azure-cis-9.2-control-1.14" do
  title "Ensure that 'Guests can invite' is set to 'No'"
  desc  "Restrict guest invitations."
  desc  "rationale", "Restricting invitations to administrators ensures that
only authorized accounts have access to cloud resources. This helps to maintain
\"Need to Know\" permissions and prevents inadvertent access to data."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `User settings`
    4. Ensure that `Guests can invite` is set to `No`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `User settings`
    4. Set `Guests can invite` to `No`
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-6", "AC-2", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["14", "16", "Rev_7"]
  tag cis_rid: "1.14"
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

