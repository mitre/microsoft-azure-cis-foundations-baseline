control "azure-cis-foundations-1.23" do
  title "Ensure that no custom subscription owner roles are created"
  desc  "Subscription ownership should not include permission to create custom
owner roles. The principle of least privilege should be followed and only
necessary privileges should be assigned instead of allowing full administrative
access."
  desc  "rationale", "Classic subscription admin roles offer basic access
management and include Account Administrator, Service Administrator, and
Co-Administrators. It is recommended the least necessary permissions be given
initially. Permissions can be added as needed by the account holder. This
ensures the account holder cannot perform actions which were not intended."
  desc  "check", "
    **Azure Command Line Interface 2.0**

     az role definition list

    Check for entries with `assignableScope` of `/` or a `subscription`, and an
action of `*`

    Verify the usage and impact of removing the role identified
  "
  desc  "fix", "
    **Azure Command Line Interface 2.0**

     az role definition list

    Check for entries with `assignableScope` of `/` or a `subscription`, and an
action of `*`

    Verify the usage and impact of removing the role identified

     az role definition delete --name \"rolename\"
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
  tag cis_controls: ["4", "16", "Rev_7"]
  tag cis_rid: "1.23"
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

