control "azure-cis-9.2-control-7.6" do
  title "Ensure that the endpoint protection for all Virtual Machines is
installed"
  desc  "Install endpoint protection for all virtual machines."
  desc  "rationale", "Installing endpoint protection systems (like Antimalware
for Azure) provides for real-time protection capability that helps identify and
remove viruses, spyware, and other malicious software, with configurable alerts
when known malicious or unwanted software attempts to install itself or run on
Azure systems."
  desc  "check", "
    **Azure Console**

    1. Go to `Security Center - Recommendations`
    2. Ensure that there are no recommendations for `Endpoint Protection not
installed on Azure VMs`

    **Azure Command Line Interface 2.0**

    ```
    az vm show -g MyResourceGroup -n MyVm -d
    ```

    It should list below or any other endpoint extensions as one of the
installed extensions.

    ```
    EndpointSecurity || TrendMicroDSA* || Antimalware || EndpointProtection ||
SCWPAgent || PortalProtectExtension* || FileSecurity*
    ```

    Alternatively, you can employ your own endpoint protection tool for your OS.
  "
  desc  "fix", "Follow Microsoft Azure documentation to install endpoint
protection from the security center. Alternatively, you can employ your own
endpoint protection tool for your OS."
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SI-3(2)", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["8.2", "Rev_7"]
  tag cis_rid: "7.6"
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
