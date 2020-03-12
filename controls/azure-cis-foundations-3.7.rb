control "azure-cis-9.2-control-3.7" do
  title "Ensure default network access rule for Storage Accounts is set to deny"
  desc  "Restricting default network access helps to provide a new layer of
security, since storage accounts accept connections from clients on any
network. To limit access to selected networks, the default action must be
changed."
  desc  "rationale", "Storage accounts should be configured to deny access to
traffic from all networks (including internet traffic). Access can be granted
to traffic from specific Azure Virtual networks, allowing a secure network
boundary for specific applications to be built. Access can also be granted to
public internet IP address ranges, to enable connections from specific internet
or on-premises clients. When network rules are configured, only applications
from allowed networks can access a storage account. When calling from an
allowed network, applications continue to require proper authorization (a valid
access key or SAS token) to access the storage account."
  desc  "check", "
    **Azure Console**

    1. Go to Storage Accounts
    2. For each `storage account`, Click on the settings menu called
`Firewalls` and `virtual networks`.
    3. Ensure that Allow access from `All networks` is not selected.

    **Azure Command Line Interface 2.0**

    Ensure `defaultAction` is not set to ` Allow`.

     az storage account list --query '[*].networkRuleSet'
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Storage Accounts`
    2. For each storage account, Click on the `settings` menu called
`Firewalls` and `virtual networks`.
    3. Ensure that you have elected to allow access from `Selected networks`.
    4. Add rules to `allow traffic` from `specific network`.
    4. Click Save to apply your changes.

    **Azure Command Line Interface 2.0**

    Use the below command to update `default-action` to `Deny`.

     az storage account update --name  --resource-group  --default-action Deny
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-2", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["16", "Rev_7"]
  tag cis_rid: "3.7"
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

  # azurerm_resource_groups.names.each do |rg_name|
  #   azurerm_storage_accounts(resource_group: rg_name).names.each do |sa_name|
  #     describe azurerm_storage_account(resource_group: rg_name, name: sa_name) do
  #       its('properties.networkAcls.virtualNetworkRules.action') { should eq 'Disabled' }
  #     end
  #   end
  # end

  describe "This control is not yet implemented. Azure Stack has not yet implemented firewall controls for storage accounts." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented firewall controls for storage accounts."
  end

end

