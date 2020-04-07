approved_endpoint_protection_extensions = input("approved_endpoint_protection_extensions", value: [])

control "azure-cis-foundations-7.6" do
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

  default_endpoint_protection_extensions = ["EndpointSecurity","TrendMicroDSA*","Antimalware","EndpointProtection","SCWPAgent","PortalProtectExtension*","FileSecurity*"]

  if input('my_resource_groups').empty? ?
    "azurerm_resource_groups.names.each do |rg_name|" :
    "input('my_resource_groups).each.do |rg_name|"
    azurerm_virtual_machines(resource_group: rg_name).vm_names.each do |vm_name|
      describe azurerm_virtual_machine(resource_group: rg_name, name: vm_name) do
        it { should have_endpoint_protection_installed approved_endpoint_protection_extensions + default_endpoint_protection_extensions }
      end
    end
  end
end

