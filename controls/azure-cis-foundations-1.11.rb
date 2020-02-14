control "azure-cis-foundations-1.11" do
  title "Ensure that 'Users can register applications' is set to 'No'"
  desc  "Require administrators to register third-party applications."
  desc  "rationale", "It is recommended to let administrator register
custom-developed applications. This ensures that the application undergoes a
security review before exposing active directory data to it."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `User settings`
    4. Ensure that `Users can register applications` is set to `No`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `User settings`
    4. Set `Users can register applications` to `No`
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
  tag cis_rid: "1.11"
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

