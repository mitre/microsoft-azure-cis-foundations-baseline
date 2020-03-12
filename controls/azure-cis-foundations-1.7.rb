control "azure-cis-9.2-control-1.7" do
  title "Ensure that 'Notify users on password resets?' is set to 'Yes'"
  desc  "Ensure that users are notified on their primary and secondary emails
on password resets."
  desc  "rationale", "User notification on password reset is a passive way of
confirming password reset activity. It helps the user to recognize unauthorized
password reset activities."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `Password reset`
    4. Go to `Notification`
    5. Ensure that `Notify users on password resets?` is set to `Yes`

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
    5. Set `Notify users on password resets?` to `Yes`
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
  tag cis_rid: "1.7"
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

