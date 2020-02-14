control "azure-cis-foundations-1.4" do
  title "Ensure that 'Allow users to remember multi-factor authentication on
devices they trust' is 'Disabled'"
  desc  "Do not allow users to remember multi-factor authentication on devices."
  desc  "rationale", "
    Remembering Multi-Factor Authentication(MFA) for devices and browsers
allows users to have the option to by-pass MFA for a set number of days after
performing a successful sign-in using MFA. This can enhance usability by
minimizing the number of times a user may need to perform two-step verification
on the same device.
    However, if an account or device is compromised, remembering MFA for
trusted devices may affect security. Hence, it is recommended that users not be
allowed to bypass MFA.
  "
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `All Users`
    4. Click on `Multi-Factor Authentication` button on the top bar
    5. Click on `service settings`
    6. Ensure that `Allow users to remember multi-factor authentication on
devices they trust` is not enabled

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `All Users`
    4. Click on `Multi-Factor Authentication` button on the top bar
    5. Click on `service settings`
    6. Disable `Allow users to remember multi-factor authentication on devices
they trust`
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["IA-2 (1)", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["16.3", "Rev_7"]
  tag cis_rid: "1.4"
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

