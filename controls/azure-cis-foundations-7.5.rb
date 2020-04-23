control "azure-cis-foundations-7.5" do
  title "Ensure that the latest OS Patches for all Virtual Machines are applied"
  desc  "Ensure that the latest OS patches for all virtual machines are
applied."
  desc  "rationale", "
    Windows and Linux virtual machines should be kept updated to:
    - Address a specific bug or flaw
    - Improve an OS or application’s general stability
    - Fix a security vulnerability

    The Azure Security Center retrieves a list of available security and
critical updates from Windows Update or Windows Server Update Services (WSUS),
depending on which service is configured on a Windows VM. The security center
also checks for the latest updates in Linux systems. If a VM is missing a
system update, the security center will recommend system updates be applied.
  "
  desc  "check", "
    **Azure Console**

    1. Go to `Security Center - Recommendations`
    2. Ensure that there are no recommendations for `Apply system updates`

    Alternatively, you can employ your own patch assessment and management tool
to periodically assess, report and install the required security patches for
your OS.

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  desc  "fix", "Follow Microsoft Azure documentation to apply security patches
from the security center. Alternatively, you can employ your own patch
assessment and management tool to periodically assess, report and install the
required security patches for your OS."
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SI-2", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["3.4", "Rev_7"]
  tag cis_rid: "7.5"
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

