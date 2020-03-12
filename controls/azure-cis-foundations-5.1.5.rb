control "azure-cis-9.2-control-5.1.5" do
  title "Ensure the storage container storing the activity logs is not publicly
accessible"
  desc  "The storage account container containing the activity log export
should not be publicly accessible."
  desc  "rationale", "Allowing public access to activity log content may aid an
adversary in identifying weaknesses in the affected account's use or
configuration."
  desc  "check", "
    **Azure Console**

    1. Go to `Activity log`
    2. Select `Export`
    3. Select
`Subscription`https://workbench.cisecurity.org/sections/43928/recommendations/115705/edit#
    4. In section `Storage Account`, note the name of the Storage account
    5. Close the `Export Audit Logs` blade. Close the `Monitor - Activity Log`
blade.
    6. In right column, Click service `Storage Accounts` to access Storage
account blade
    7. Click on the storage account name noted in step 4. This will open blade
specific to that storage account
    8. In Section `Blob Service` click `Containers`. It will list all the
containers in next blade
    9. Look for a record with container named as `insight-operational-logs`.
Click `...` from right most column to open `Context menu`
    10. Click `Access Policy` from `Context Menu` and ensure `Public Access
Level` is set to `Private (no anonymous access)`

    **Azure Command Line Interface 2.0**

    1. Get storage account id configured with log profile:

    ```
    az monitor log-profiles list --query [*].storageAccountId
    ```

    2. Ensure the container storing activity logs (insights-operational-logs)
is not publicly accessible:

    ```
    az storage container list --account-name  --query
\"[?name=='insights-operational-logs']\"
    ```

    In command output ensure `publicAccess` is set to `null`
  "
  desc  "fix", "
    **Azure Console**

    1. In right column, Click service `Storage Accounts` to access Storage
account blade
    2. Click on the storage account name
    3. In Section `Blob Service` click `Containers`. It will list all the
containers in next blade
    4. Look for a record with container named as `insight-operational-logs`.
Click `...` from right most column to open `Context menu`
    5. Click `Access Policy` from `Context Menu` and set `Public Access Level`
to `Private (no anonymous access)`

    **Azure Command Line Interface 2.0**

    ```
    az storage container set-permission --name insights-operational-logs
--account-name  --public-access off
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
  tag nist: ["AU-6", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["6", "Rev_7"]
  tag cis_rid: "5.1.5"
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

