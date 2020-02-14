control "azure-cis-foundations-3.6" do
  title "Ensure that 'Public access level' is set to Private for blob
containers"
  desc  "Disable anonymous access to blob containers."
  desc  "rationale", "Anonymous, public read access to a container and its
blobs can be enabled in Azure Blob storage. It grants read-only access to these
resources without sharing the account key, and without requiring a shared
access signature. It is recommended not to provide anonymous access to blob
containers until, and unless, it is strongly desired. A shared access signature
token should be used for providing controlled and timed access to blob
containers."
  desc  "check", "
    **Azure Console**

    1. Go to `Storage Accounts`
    2. For each storage account, go to `Containers` under `BLOB SERVICE`
    3. For each container, click `Access policy`
    4. Ensure that `Public access level` is set to `Private (no anonymous
access)`

    **Azure Command Line Interface 2.0**

    Ensure the below command output contains null

    ```
    az storage container list --account-name  --account-key  --query
'[*].properties.publicAccess'
    ```
  "
  desc  "fix", "
    **Azure Console**

    First, follow Microsoft documentation and created shared access signature
tokens for your blob containers. Then,

    1. Go to `Storage Accounts`
    2. For each storage account, go to `Containers` under `BLOB SERVICE`
    3. For each container, click `Access policy`
    4. Set `Public access level` to `Private (no anonymous access)`

    **Azure Command Line Interface 2.0**

    1. Identify the container name from the audit command
    2. Set the permission for public access to `private`(off) for the above
container name, using the below command

    ```
    az storage container set-permission --name  --public-access off
--account-name  --account-key
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
  tag nist: ["AC-2", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["16", "Rev_7"]
  tag cis_rid: "3.6"
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

