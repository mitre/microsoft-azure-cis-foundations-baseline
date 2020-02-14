control "azure-cis-foundations-4.1" do
  title "Ensure SQL server's TDE protector is encrypted with BYOK (Use your own
key)"
  desc  "TDE with BYOK support provides increased transparency and control over
the TDE Protector, increased security with an HSM-backed external service, and
promotion of separation of duties.

    With TDE, data is encrypted at rest with a symmetric key (called the
database encryption key) stored in the database or data warehouse distribution.
To protect this data encryption key (DEK) in the past, only a certificate that
the Azure SQL Service managed could be used. Now, with BYOK support for TDE,
the DEK can be protected with an asymmetric key that is stored in the Key
Vault. Key Vault is a highly available and scalable cloud-based key store which
offers central key management, leverages FIPS 140-2 Level 2 validated hardware
security modules (HSMs), and allows separation of management of keys and data,
for additional security.

    Based on business needs or criticality of data/databases hosted a SQL
server, it is recommended that the TDE protector is encrypted by a key that is
managed by the data owner (BYOK).
  "
  desc  "rationale", "Bring Your Own Key (BYOK) support for Transparent Data
Encryption (TDE) allows user control of TDE encryption keys and restricts who
can access them and when. Azure Key Vault, Azure’s cloud-based external key
management system is the first key management service where TDE has integrated
support for BYOK. With BYOK, the database encryption key is protected by an
asymmetric key stored in the Key Vault. The asymmetric key is set at the server
level and inherited by all databases under that server. This feature is
currently in preview and we do not recommend using it for production workloads
until we declare General Availability."
  desc  "check", "
    **Azure Portal:**

    1. Go to `SQL servers`
    2. For the desired server instance
    3. Click On `Transparent data encryption`
    4. Ensure that `Use your own key` is set to `YES`
    5. Ensure `Make selected key the default TDE protector` is checked

    **Azure CLI:**

    ```
    az account get-access-token --query
\"{subscripton:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\" GET
https://management.azure.com/subscriptions/$0/resourceGroups/{resourceGroupName}/providers/Microsoft.Sql/servers/{serverName}/encryptionProtector?api-version=2015-05-01-preview'
    ```

    Ensure the output of the command contains properties

    `kind` set to `azurekeyvault`

    `serverKeyType` set to `AzureKeyVault`

    `uri` is not null
  "
  desc  "fix", "
    **Azure Console:**

    Go to `SQL servers`

    For the desired server instance

    1. Click On `Transparent data encryption`
    2. Set `Use your own key` to `YES`
    3. Browse through your `key vaults` to Select an existing key or create a
new key in Key Vault.
    4. Check `Make selected key the default TDE protector`

    **Azure CLI:**

    Use the below command to encrypt SQL server's TDE protector with BYOK
    ```
    az sql server tde-key >> Set --resource-group  --server  --server-key-type
{AzureKeyVault} [--kid ]```
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SC-28", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["16.4", "Rev_7"]
  tag cis_rid: "4.1"
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

