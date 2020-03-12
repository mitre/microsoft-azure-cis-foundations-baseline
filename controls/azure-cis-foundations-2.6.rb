control "azure-cis-9.2-control-2.6" do
  title "Ensure ASC Default policy setting \"Monitor Disk Encryption\" is not
\"Disabled\""
  desc  "Enable Disk encryption recommendations for virtual machines."
  desc  "rationale", "When this setting is enabled, it recommends enabling disk
encryption in all virtual machines (Windows and Linux as well) to enhance data
protection at rest."
  desc  "check", "
    **Azure Console**

    1. Go to Azure Security Center
    2. Click On the `security policy` to Open Policy Management Blade.
    3. Click `Subscription View`
    4. Click on `Subscription Name` to open Security Policy Blade for the
Subscription.
    5. Expand `Compute And Apps`
    6. Ensure that `Disk Encryption` is not set to `Disabled`

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command is not `Disabled` or Empty

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn?api-version=2018-05-01'
| jq 'select(.name==\"SecurityCenterBuiltIn\")'|jq
'.properties.parameters.diskEncryptionMonitoringEffect.value'
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Navigate to `Azure Policy`
    2. On Policy \"Overview\" blade, Click on Policy `ASC Default
(Subscription:Subscription_ID)`
    3. On \"ASC Default\" blade, Click on `Edit Assignments`
    4. In section `PARAMETERS`, Set `Monitor Disk Encryption` to
`AuditIfNotExists` or any other available value than `Disabled`
    5. Click `Save`
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
  tag cis_rid: "2.6"
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

  describe "This control has not been implemented yet. Security Center is an Azure Cloud offering and has not yet been implemented for Azure Stack." do
    skip "This control has not been implemented yet. Security Center is an Azure Cloud offering and has not yet been implemented for Azure Stack."
  end
end

