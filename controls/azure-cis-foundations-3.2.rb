control "azure-cis-9.2-control-3.2" do
  title "Ensure that storage account access keys are periodically regenerated"
  desc  "Regenerate storage account access keys periodically."
  desc  "rationale", "When a storage account is created, Azure generates two
512-bit storage access keys, which are used for authentication when the storage
account is accessed. Rotating these keys periodically ensures that any
inadvertent access or exposure does not result in these keys being compromised."
  desc  "check", "
    **Azure Console**

    1. Go to `Storage Accounts`
    2. For each storage account, go to `Activity log`
    3. Under `Timespan` drop-down, select `Custom` and choose `Start time` and
`End time` such that it ranges 90 days
    4. Enter `RegenerateKey` in the `Search` text box
    5. Click `Apply`

    It should list out all `RegenerateKey` events. If no such event exists,
then this is a finding.

    **Azure Command Line Interface 2.0**

    **Step 1 - Get a list of storage accounts**

    ```
    az storage account list
    ```

    Make a note of `id`, `name` and `resourceGroup`.

    **Step 2**
    For every storage account make sure that key is regenerated in past 90 days.

    ```
    az monitor activity-log list --resource-group
    ```

    The output should contain

    ```
    \"authorization\"/\"scope\":  AND \"authorization\"/\"action\":
\"Microsoft.Storage/storageAccounts/regenerateKey/action\" AND
\"status\"/\"localizedValue\": \"Succeeded\" \"status\"/\"Value\":
\"Succeeded\" AND \"eventTimestamp\" : (Should return time and date should be
less than past 90 days)
    ```
  "
  desc  "fix", "Follow Microsoft Azure documentation for regenerating storage
account access keys."
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-2", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["16", "Rev_7"]
  tag cis_rid: "3.2"
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
        its('has_recently_generated_access_key?') {should be true}
      end
    end
  end

end

