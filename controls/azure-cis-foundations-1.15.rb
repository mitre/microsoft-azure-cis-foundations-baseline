control "azure-cis-foundations-1.15" do
  title "Ensure that 'Restrict access to Azure AD administration portal' is set
to 'Yes'"
  desc  "Restrict access to the Azure AD administration portal to
administrators only."
  desc  "rationale", "The Azure AD administrative portal has sensitive data.
All non-administrators should be prohibited from accessing any Azure AD data in
the administration portal to avoid exposure."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `User settings`
    4. Ensure that `Restrict access to Azure AD administration portal` is set
to `Yes`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `User settings`
    4. Set `Restrict access to Azure AD administration portal` to `Yes`
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-6", "AC-6", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["4", "14", "Rev_7"]
  tag cis_rid: "1.15"
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

