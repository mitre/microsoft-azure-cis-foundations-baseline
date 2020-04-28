control "azure-cis-foundations-3.8" do
  title "Ensure 'Trusted Microsoft Services' is enabled for Storage Account
access"
  desc  "Some Microsoft services that interact with storage accounts operate
from networks that can't be granted access through network rules. To help this
type of service work as intended, allow the set of trusted Microsoft services
to bypass the network rules. These services will then use strong authentication
to access the storage account. If the Allow trusted Microsoft services
exception is enabled, the following services: Azure Backup, Azure Site
Recovery, Azure DevTest Labs, Azure Event Grid, Azure Event Hubs, Azure
Networking, Azure Monitor and Azure SQL Data Warehouse (when registered in the
subscription), are granted access to the storage account."
  desc  "rationale", "Turning on firewall rules for storage account will block
access to incoming requests for data, including from other Azure services. This
includes using the Portal, writing logs, etc. We can re-enable functionality.
The customer can get access to services like Monitor, Networking, Hubs, and
Event Grid by enabling `\"Trusted Microsoft Services\"` through exceptions.
Also, Backup and Restore of Virtual Machines using unmanaged disks in storage
accounts with network rules applied is supported via creating an exception."
  desc  "check", "
    **Azure Console**

    1. Go to `Storage Accounts`
    2. For each storage account, Click on the settings menu called `Firewalls`
and `virtual networks`.
    3. Click on `Selected networks`.
    4. Ensure that `Allow trusted Microsoft services to access this storage
account` is checked in `Exceptions`.

    **Azure Command Line Interface 2.0**

    Ensure `bypass` contains `AzureServices`

     az storage account list --query '[*].networkRuleSet'
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Storage Accounts`
    2. For each storage account, Click on the settings menu called `Firewalls`
and `virtual networks`.
    3. Ensure that you have elected to allow access from 'Selected networks'.
    4. Enable check box for `Allow trusted Microsoft services to access this
storage account`.
    4. Click Save to apply your changes.

    **Azure Command Line Interface 2.0**

    Use the below command to update `trusted Microsoft services`.

     az storage account update --name  --resource-group  --bypass AzureServices
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["CM-7 (1)", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["9.2", "Rev_7"]
  tag cis_rid: "3.8"
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


  describe "This control is not yet implemented. Azure Stack has not yet implemented firewall controls for storage accounts." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented firewall controls for storage accounts."
  end


end

