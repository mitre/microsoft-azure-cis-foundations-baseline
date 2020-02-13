control "azure-cis-9.2-control-6.1" do
  title "Ensure that RDP access is restricted from the internet"
  desc  "Disable RDP access on network security groups from the Internet."
  desc  "rationale", "The potential security problem with using RDP over the
Internet is that attackers can use various brute force techniques to gain
access to Azure Virtual Machines. Once the attackers gain access, they can use
a virtual machine as a launch point for compromising other machines on an Azure
Virtual Network or even attack networked devices outside of Azure."
  desc  "check", "
    **Azure Console**

    1. For each VM, open the `Networking` blade
    2. Verify that the `INBOUND PORT RULES` **does not** have a rule for RDP
such as
     - port = `3389`,
     - protocol = `TCP`,
     - Source = `Any` OR `Internet`

    **Azure Command Line Interface 2.0**

    List Network security groups with corresponding non-default Security rules:

    ```
    az network nsg list --query [*].[name,securityRules]
    ```

    Ensure that none of the NSGs have security rule as below

    ```
    \"access\" : \"Allow\"
    \"destinationPortRange\" : \"3389\" or \"*\" or \"[port range containing
3389]\"
    \"direction\" : \"Inbound\"
    \"protocol\" : \"TCP\"
    \"sourceAddressPrefix\" : \"*\" or \"0.0.0.0\" or \"/0\" or \"/0\" or
\"internet\" or \"any\"
    ```
  "
  desc  "fix", "
    Disable direct RDP access to your Azure Virtual Machines from the Internet.
After direct RDP access from the Internet is disabled, you have other options
you can use to access these virtual machines for remote management:

     - [Point-to-site
VPN](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-point-to-site-resource-manager-portal)

     - [Site-to-site
VPN](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal)

     - [ExpressRoute](https://docs.microsoft.com/en-us/azure/expressroute/)
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["CM-7 (1)", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["9.2", "Rev_7"]
  tag cis_rid: "6.1"
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

