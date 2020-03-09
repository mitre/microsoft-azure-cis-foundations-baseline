control "azure-cis-9.2-control-3.5" do
  title "Ensure that shared access signature tokens are allowed only over https"
  desc  "Shared access signature tokens should be allowed only over HTTPS
protocol."
  desc  "rationale", "A shared access signature (SAS) is a URI that grants
restricted access rights to Azure Storage resources. A shared access signature
can be provided to clients who should not be trusted with the storage account
key but for whom it may be necessary to delegate access to certain storage
account resources. Providing a shared access signature URI to these clients
allows them access to a resource for a specified period of time. It is
recommended to allow such access requests over HTTPS protocol only."
  desc  "check", "Currently, SAS token protocols cannot be audited. Until
Microsoft makes SAS transfer protocols a setting rather than a token creation
parameter, this recommendation will require a manual verification."
  desc  "fix", "
    **Azure Console**

    1. Go to `Storage Accounts`
    2. For each storage account, go to `Shared access signature`
    3. Set `Allowed protocols` to `HTTPS only`

    *Please note that at this point of time, there is no API/CLI mechanism
available to programmatically conduct security assessment for this
recommendation.*
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SC-28", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["16.4", "Rev_7"]
  tag cis_rid: "3.5"
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
        #check if SAS exists
        its('properties.supportsHttpsTrafficOnly') { should be true }
      end
    end
  end

end

