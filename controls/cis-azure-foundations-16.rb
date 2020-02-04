control 'cis-azure-foundations-16' do
    title "Ensure default network access rule for Storage Accounts is set to deny"
    tag "nist": ['', 'Rev_4']
    desc  "Restricting default network access helps to provide a new layer of security, since storage accounts accept connections from clients on any network. To limit access to selected networks, the default action must be changed."
    impact 1
    tag "rationale": "Restricting default network access helps to provide a new layer of security, since storage accounts accept connections from clients on any network. To limit access to selected networks, the default action must be changed."
    tag "cis_impact": ''
    tag "cis_rid": '16'
    tag "cis_level": 2
    tag "nist": ['', 'Rev_4']
  
    tag "check": "Set network access to 'deny'
    Run the following to check if defaultAction is not set to Allow
    az storage account list --query '[*].networkRuleSet'
  
    "
    tag "fix": "Set 'default-action' to 'Deny'
    az storage account update --name <StorageAccountName> --resource-group <resourceGroupName> --default-action Deny
    "

    azurerm_resource_groups.names.each do |rg_name|
      azurerm_storage_accounts(resource_group: rg_name).names.each do |sa_name|
        describe azurerm_storage_account(resource_group: rg_name, name: sa_name) do
          it { should exist }
        end
      end
    end
  
  end