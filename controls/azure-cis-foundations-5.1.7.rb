control "azure-cis-foundations-5.1.7" do
  title "Ensure that logging for Azure KeyVault is 'Enabled'"
  desc  "Enable AuditEvent logging for key vault instances to ensure
interactions with key vaults are logged and available."
  desc  "rationale", "Monitoring how and when key vaults are accessed, and by
whom enables an audit trail of interactions with confidential information, keys
and certificates managed by Azure Keyvault. Enabling logging for Key Vault
saves information in an Azure storage account that the user provides. This
creates a new container named insights-logs-auditevent automatically for the
specified storage account, and this same storage account can be used for
collecting logs for multiple key vaults."
  desc  "check", "
    **Azure Console**

    1. Go to `Key vaults`
    2. For each Key vault
    3. Go to `Diagnostic Logs`
    4. Click on `Edit Settings`
    5. Ensure that `Archive to a storage account` is `Enabled`
    6. Ensure that `AuditEvent` is checked and the retention days is set to
`180 days or as appropriate`

    **Azure Command Line Interface 2.0**

    List all key vaults

    ```
    az keyvault list
    ```

    For each keyvault `id`
    ```
    az monitor diagnostic-settings list --resource
    ```

    Ensure that `storageAccountId` is set as appropriate. Also, ensure that
`category` and `days` are set. One of the sample outputs is as below.

    ```
    \"logs\": [
     {
     \"category\": \"AuditEvent\",
     \"enabled\": true,
     \"retentionPolicy\": {
     \"days\": 180,
     \"enabled\": true
     }
     }
     ]
    ```
  "
  desc  "fix", "Follow Microsoft Azure documentation and setup Azure Key Vault
Logging."
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AU-3", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["6.3", "Rev_7"]
  tag cis_rid: "5.1.7"
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

