control "azure-cis-foundations-1.22" do
  title "Ensure that 'Require Multi-Factor Auth to join devices' is set to
'Yes'"
  desc  "Joining devices to the active directory should require Multi-factor
authentication."
  desc  "rationale", "Multi-factor authentication is recommended when adding
devices to Azure AD. When set to \"Yes\", users who are adding devices from the
internet must first use the second method of authentication before their device
is successfully added to the directory. This ensures that rogue devices are not
added to the directory for a compromised user account."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Device settings`
    4. Ensure that `Require Multi-Factor Auth to join devices` is set to `Yes`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Device settings`
    4. Set `Require Multi-Factor Auth to join devices` to `Yes`
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["IA-2 (1)", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["16.3", "Rev_7"]
  tag cis_rid: "1.22"
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

