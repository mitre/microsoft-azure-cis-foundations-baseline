control "azure-cis-9.2-control-7.1" do
  title "Ensure that 'OS disk' are encrypted"
  desc  "Ensure that OS disks (boot volumes) are encrypted, where possible."
  desc  "rationale", "Encrypting the IaaS VM's OS disk (boot volume) ensures
that its entire content is fully unrecoverable without a key and thus protects
the volume from unwarranted reads."
  desc  "check", "
    **Azure Console**

    1. Go to `Virtual machines`
    2. For each virtual machine, go to `Settings`
    3. Click on `Disks`
    4. Ensure that the `OS disk` has encryption set to `Enabled`

    **Azure Command Line Interface 2.0**

    Ensure the below command output is shown as `Encrypted`

    ```
    az vm encryption show --name  --resource-group  --query osDisk
    ```
  "
  desc  "fix", "
    **Azure Console**

    Follow Microsoft Azure documentation.

    **Azure Command Line Interface 2.0**

    Use the below command to enable encryption for OS Disk for the specific VM.

    ```
    az vm encryption enable --name  --resource-group  --volume-type OS
--aad-client-id  --aad-client-secret  --disk-encryption-keyvault
https:///secrets//
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
  tag cis_rid: "7.1"
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

