control "azure-cis-foundations-1.3" do
  title "Ensure that there are no guest users"
  desc  "Do not add guest users if not needed."
  desc  "rationale", "Azure AD is extended to include Azure AD B2B
collaboration, allowing you to invite people from outside your organization to
be guest users in your cloud account. Until you have a business need to provide
guest access to any user, avoid creating guest users. Guest users are typically
added outside your employee on-boarding/off-boarding process and could
potentially be overlooked indefinitely leading to a potential vulnerability."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `All Users`
    4. Click on `Show` drop down and select `Guest users only`
    5. Ensure that there are no guest users listed (`USER TYPE` = `Guest`)

    **Azure Command Line Interface 2.0**
    ```
    az ad user list --query \"[?additionalProperties.userType=='Guest']\"
    ```

    If any users are listed, then this recommendation is non-compliant.
  "
  desc  "fix", "Delete the \"Guest\" users."
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
  tag cis_controls: ["16.8", "Rev_7"]
  tag cis_rid: "1.3"
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

