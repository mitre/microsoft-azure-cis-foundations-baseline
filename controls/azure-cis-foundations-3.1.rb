# frozen_string_literal: true

control 'azure-cis-9.2-control-3.1' do
  title "Ensure that 'Secure transfer required' is set to 'Enabled'"
  desc  'Enable data encryption is transit.'
  desc  'rationale', "The secure transfer option enhances the security of a
storage account by only allowing requests to the storage account by a secure
connection. For example, when calling REST APIs to access storage accounts, the
connection must use HTTPS. Any requests using HTTP will be rejected when
'secure transfer required' is enabled. When using the Azure files service,
connection without encryption will fail, including scenarios using SMB 2.1, SMB
3.0 without encryption, and some flavors of the Linux SMB client. Because Azure
storage doesn’t support HTTPS for custom domain names, this option is not
applied when using a custom domain name."
  desc  'check', "
    **Azure Console**

    1. Go to `Storage Accounts`
    2. For each storage account, go to `Configuration`
    3. Ensure that `Secure transfer required` is set to `Enabled`

    **Azure Command Line Interface 2.0**

    Use the below command to ensure the `Secure transfer required` is enabled
for all the `Storage Accounts` by ensuring the output contains `true` for each
of the `Storage Accounts`.

    ```
    az storage account list --query [*].[name,enableHttpsTrafficOnly]
    ```
  "
  desc 'fix', "
    **Azure Console**

    1. Go to `Storage Accounts`
    2. For each storage account, go to `Configuration`
    3. Set `Secure transfer required` to `Enabled`

    **Azure Command Line Interface 2.0**

    Use the below command to enable `Secure transfer required` for a `Storage
Account`

    ```
    az storage account update --name  --resource-group  --https-only true
    ```
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: %w[SC-8 Rev_4]
  tag cis_level: 1
  tag cis_controls: ['14.4', 'Rev_7']
  tag cis_rid: '3.1'
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

  azurerm_resource_groups.names.each do |rg_name|
    azurerm_storage_accounts(resource_group: rg_name).names.each do |sa_name|
      describe azurerm_storage_account(resource_group: rg_name, name: sa_name) do
        its('properties.supportsHttpsTrafficOnly') { should be true }
      end
    end
  end
end
