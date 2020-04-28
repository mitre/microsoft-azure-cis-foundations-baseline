control "azure-cis-foundations-7.3" do
  title "Ensure that 'Unattached disks' are encrypted"
  desc  "Ensure that unattached disks in a subscription are encrypted."
  desc  "rationale", "
    Encrypting the IaaS VM's disks ensures that its entire content is fully
unrecoverable without a key and thus protects the volume from unwarranted
reads.
    Even if the disk is not attached to any of the VMs, there is always a risk
where a compromised user account with administrative access to VM service can
mount/attach these data disks which may lead to sensitive information
disclosure and tampering.
  "
  desc  "check", "
    **Azure Console**

    At the time of writing this recommendation, we haven't found any
`encryption` setting for a disk in `Disks` blade.

    **Azure Command Line Interface 2.0**

    Ensure command below does not retruns any output.

    ```
    az disk list --query '[? managedBy == `null`].{encryptionSettings:
encryptionSettings, name: name}' -o json
    ```

    Sample Output:

    ```
    [
     {
     \"encryptionSettings\": null,
     \"name\": \"\"
     },
     {
     \"encryptionSettings\": null,
     \"name\": \"\"
     }
    ]
    ```
  "
  desc  "fix", "
    If data stored in the disk is no longer useful, refer to Azure
documentation to delete unattached data disks at:

    ```
    -https://docs.microsoft.com/en-us/rest/api/compute/disks/delete

-https://docs.microsoft.com/en-us/cli/azure/disk?view=azure-cli-latest#az-disk-delete
    ```

    If data stored in the disk is important, To encrypt the disk refer azure
documentation at:

    ```

-https://docs.microsoft.com/en-us/rest/api/compute/disks/update#encryptionsettings

-https://docs.microsoft.com/en-us/cli/azure/disk?view=azure-cli-latest#az-disk-update
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
  tag nist: ["SC-28", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["14.8", "Rev_7"]
  tag cis_rid: "7.3"
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

  impact 0
  describe "This control is not yet implemented. Azure Stack has not yet implemented encrypting disk with your own keys." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented encrypting disk with your own keys."
  end

end

