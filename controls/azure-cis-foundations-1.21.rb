control "azure-cis-foundations-1.21" do
  title "Ensure that 'Enable \"All Users\" group' is set to 'Yes'"
  desc  "Enable `All Users` group for centralized administration of all users."
  desc  "rationale", "The `All Users` group can be used to assign the same
permissions to all the users in the directory. For example, all users in a
directory can be given access to a SaaS application by assigning access for the
All Users dedicated group to this application. This ensures that there is a
common policy created for all users and there is no need to restrict individual
permissions."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Group settings`
    4. Ensure that `Enable \"All Users\" group` is set to `Yes`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Group settings`
    4. Set `Enable \"All Users\" group` to `Yes`
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
  tag cis_rid: "1.21"
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

