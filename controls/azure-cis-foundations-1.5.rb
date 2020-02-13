control "azure-cis-9.2-control-1.5" do
  title "Ensure that 'Number of methods required to reset' is set to '2'"
  desc  "Ensure that two alternate forms of identification are provided before
allowing a password reset."
  desc  "rationale", "Like multi-factor authentication, setting up dual
identification before allowing a password reset ensures that the user identity
is confirmed via two separate forms of identification. With dual identification
set, an attacker would require compromising both the identity forms before
he/she could maliciously reset a user's password."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Password reset`
    4. Go to `Authentication methods`
    5. Ensure that `Number of methods required to reset` is set to `2`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Password reset`
    4. Go to `Authentication methods`
    5. Set the `Number of methods required to reset` to `2`
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
  tag cis_rid: "1.5"
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

