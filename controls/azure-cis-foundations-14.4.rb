control 'cis-azure-foundations-14.4' do
  title "Ensure that 'Secure transfer required' is set to 'Enabled'"
  tag "nist": ['', 'Rev_4']
  desc  "The secure transfer option enhances the security of a storage account by only allowing requests to the storage account by a secure connection. For example, when calling REST APIs to access storage accounts, the connection must use HTTPS. Any requests using HTTP will be rejected when 'secure transfer required' is enabled. When using the Azure files service, connection without encryption will fail, including scenarios using SMB 2.1, SMB 3.0 without encryption, and some flavors of the Linux SMB client. Because Azure storage doesn’t support HTTPS for custom domain names, this option is not applied when using a custom domain name."
  impact 1
  tag "rationale": "The secure transfer option enhances the security of a storage account by only allowing requests to the storage account by a secure connection. For example, when calling REST APIs to access storage accounts, the connection must use HTTPS. Any requests using HTTP will be rejected when 'secure transfer required' is enabled. When using the Azure files service, connection without encryption will fail, including scenarios using SMB 2.1, SMB 3.0 without encryption, and some flavors of the Linux SMB client. Because Azure storage doesn’t support HTTPS for custom domain names, this option is not applied when using a custom domain name."
  tag "cis_impact": ''
  tag "cis_rid": '14.4'
  tag "cis_level": 1
  tag "nist": ['', 'Rev_4']

  tag "check": "Set 'Secure transfer required' to 'Enabled'
  Run the following check to list storage account settings
  az storage account list --query [*].[name,enableHttpsTrafficOnly]

  "
  tag "fix": "Set 'Secure tranfer required' to 'Enabled'
  az storage account update --name <storageAccountName> --resource-group <resourceGroupName> --https-only true
  "

  azurerm_resource_groups.names.each do |rg_name|
    azurerm_storage_accounts(resource_group: rg_name).names.each do |sa_name|
      describe azurerm_storage_account(resource_group: rg_name, name: sa_name) do
        its('properties.supportsHttpsTrafficOnly') { should be true}
      end
    end
  end

end