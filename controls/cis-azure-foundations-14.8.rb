control 'cis-azure-foundations-14.8' do
    title "Ensure that OS disks (boot volumes) are encrypted, where possible."
    tag "nist": ['', 'Rev_4']
    desc  "Encrypting the IaaS VM's OS disk (boot volume) ensures that its entire content is fully unrecoverable without a key and thus protects the volume from unwarranted reads."
    impact 1
    tag "rationale": "Encrypting the IaaS VM's OS disk (boot volume) ensures that its entire content is fully unrecoverable without a key and thus protects the volume from unwarranted reads."
    tag "cis_impact": ''
    tag "cis_rid": '14.4'
    tag "cis_level": 1
    tag "nist": ['', 'Rev_4']
  
    tag "check": "Ensure the below command output is shown as Encrypted az vm encryption show --name <VMName> --resource-group <resourceGroupName> --query osDisk
  
    "
    tag "fix": "Use the below command to enable encryption for OS Disk for the specific VM. 
    az vm encryption enable --name <VMName> --resource-group <resourceGroupName> --volume-type OS --aad-client-id <Client ID of AAD app> --aad-client-secret <Client Secret of AAD app> --disk-encryption-keyvault https://<vaultEndpoint>/secrets/<secretName>/<secretVersion>
    "
  
    azurerm_resource_groups.names.each do |rg_name|
        azurerm_virtual_machine_disks.names.each do |disk_name|
          azurerm_virtual_machine_disk(resource_group: rg_name, name: disk_name) do
            its('encryption_enabled') { should be true }
          end
        end
      end
  
  end