control "azure-cis-foundations-5.1.6" do
  title "Ensure the storage account containing the container with activity logs
is encrypted with BYOK (Use Your Own Key)"
  desc  "The storage account with the activity log export container is
configured to use BYOK (Use Your Own Key)."
  desc  "rationale", "Configuring the storage account with the activity log
export container to use BYOK (Use Your Own Key) provides additional
confidentiality controls on log data as a given user must have read permission
on the corresponding storage account and must be granted decrypt permission by
the CMK."
  desc  "check", "
    **Azure Console**

    1. Go to `Activity log`
    2. Select `Export`
    3. Select `Subscription`
    4. In section `Storage Account`, note the name of the Storage account
    5. Close the `Export Audit Logs` blade. Close the `Monitor - Activity Log`
blade.
    6. In right column, Click service `Storage Accounts` to access Storage
account blade
    7. Click on the storage account name noted in step 4. This will open blade
specific to that storage account
    8. In Section `SETTINGS` click `Encryption`. It will show `Storage service
encryption` configuration pane.
    9. Ensure `Use your own key` is checked and `Key URI` is set.

    **Azure Command Line Interface 2.0**

    1. Get storage account id configured with log profile:

    ```
    az monitor log-profiles list --query [*].storageAccountId
    ```

    2. Ensure the storage account is encrypted with CMK:

    ```
    az storage account list --query \"[?name=='']\"
    ```

    In command output ensure `keySource` is set to `Microsoft.Keyvault` and
`keyVaultProperties` is not set to `null`
  "
  desc  "fix", "
    **Azure Console**

    1. In right column, Click service `Storage Accounts` to access Storage
account blade
    2. Click on the storage account name
    3. In Section `SETTINGS` click `Encryption`. It will show `Storage service
encryption` configuration pane.
    4. Check `Use your own key` which will expand `Encryption Key` Settings
    5. Use option `Enter key URI` or `Select from Key Vault` to set up
encryption with your own key

    **Azure Command Line Interface 2.0**

    ```
    az storage account update --name  --resource-group
--encryption-key-source=Microsoft.Keyvault --encryption-key-vault
--encryption-key-name  --encryption-key-version
    ```
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AU-6", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["6", "Rev_7"]
  tag cis_rid: "5.1.6"
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

  describe "This control is not yet implemented. Azure Stack has not yet implemented exporting activity logs from azure stack." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented exporting activity logs from azure stack."
  end
end

