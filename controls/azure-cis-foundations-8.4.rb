control "azure-cis-foundations-8.4" do
  title "Ensure the key vault is recoverable"
  desc  "The key vault contains object keys, secrets and certificates.
Accidental unavailability of a key vault can cause immediate data loss or loss
of security functions (authentication, validation, verification,
non-repudiation, etc.) supported by the key vault objects.

    It is recommended the key vault be made recoverable by enabling the \"Do
Not Purge\" and \"Soft Delete\" functions. This is in order to prevent loss of
encrypted data including storage accounts, SQL databases, and/or dependent
services provided by key vault objects (Keys, Secrets, Certificates) etc., as
may happen in the case of accidental deletion by a user or from disruptive
activity by a malicious user.
  "
  desc  "rationale", "
    There could be scenarios where users accidently run delete/purge commands
on key vault or attacker/malicious user does it deliberately to cause
disruption.
    Deleting or purging a key vault leads to immediate data loss as keys
encrypting data and secrets/certificates allowing access/services will become
non-accessible.
    There are 2 key vault properties that plays role in permanent
unavailability of a key vault.

    1> `enableSoftDelete`:

    Setting this parameter to true for a key vault ensures that even if key
vault is deleted, Key vault itself or its objects remain recoverable for next
90days. In this span of 90 days either key vault/objects can be recovered or
purged (permanent deletion). If no action is taken, after 90 days key vault and
its objects will be purged.

    2> `enablePurgeProtection`:

    enableSoftDelete only ensures that key vault is not deleted permanently and
will be recoverable for 90 days from date of deletion. However, there are
chances that the key vault and/or its objects are accidentally purged and hence
will not be recoverable. Setting enablePurgeProtection to \"true\" ensures that
the key vault and its objects cannot be purged.

    Enabling both the parameters on key vaults ensures that key vaults and
their objects cannot be deleted/purged permanently.
  "
  desc  "check", "
    **Via Azure Portal**

    Azure Portal does not have provision to update the respective configurations

    **Via Azure CLI 2.0**

    1> List all Resources of type Key Vaults:

    ```
    az resource list --query \"[?type=='Microsoft.KeyVault/vaults']\"
    ```

    2> For Every Key Vault ID ensure check parameters `enableSoftDelete` and
`enablePurgeProtection` are set to enabled.

    ```
    az resource show --id
/subscriptions/xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups//providers/Microsoft.KeyVault
    /vaults/
    ```
  "
  desc  "fix", "
    To enable \"Do Not Purge\" and \"Soft Delete\" for a Key Vault:

    **Via Azure Portal**
    Azure Portal does not have provision to update the respective configurations

    **Via Azure CLI 2.0**

    ```
    az resource update --id
/subscriptions/xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups//providers/Microsoft.KeyVault
    /vaults/ --set properties.enablePurgeProtection=true
properties.enableSoftDelete=true
    ```
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["CP-9", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["10", "Rev_7"]
  tag cis_rid: "8.4"
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

