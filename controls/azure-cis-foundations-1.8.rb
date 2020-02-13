control "azure-cis-9.2-control-1.8" do
  title "Ensure that 'Notify all admins when other admins reset their
password?' is set to 'Yes'"
  desc  "Ensure that all administrators are notified if any other administrator
resets their password."
  desc  "rationale", "Administrator accounts are sensitive. Any password reset
activity notification, when sent to all administrators, ensures that all
administrators can passively confirm if such a reset is a common pattern within
their group. For example, if all administrators change their password every 30
days, any password reset activity before that may require administrator(s) to
evaluate any unusual activity and confirm its origin."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Password reset`
    4. Go to `Notification`
    5. Ensure that `notify all admins when other admins reset their password?`
is set to `Yes`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Password reset`
    4. Go to `Notification`
    5. Set `Notify all admins when other admins reset their password?` to `Yes`
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-6", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["4", "Rev_7"]
  tag cis_rid: "1.8"
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

