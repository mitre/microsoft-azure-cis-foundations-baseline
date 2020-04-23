control "azure-cis-foundations-2.12" do
  title "Ensure ASC Default policy setting \"Monitor JIT Network Access\" is
not \"Disabled\""
  desc  "Enable JIT Network Access for virtual machines."
  desc  "rationale", "When this setting is enabled, Security Center locks down
inbound traffic to the Azure VMs by creating an NSG rule. The user can select
the ports on the VM where inbound traffic should be locked down. Just in time
virtual machine (VM) access can be used to lock down inbound traffic to the
Azure VMs, reducing exposure to attacks while providing easy access to connect
to VMs when needed."
  desc  "check", "
    **Azure Console**

    1. Go to Azure Security Center
    2. Click On the `security policy` to Open Policy Management Blade.
    3. Click `Subscription View`
    4. Click on `Subscription Name` to open Security Policy Blade for the
Subscription.
    5. Expand `Network`
    6. Ensure that `JIT Network Access` is not set to `Disabled`

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command is not `Disabled` or Empty

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn?api-version=2018-05-01'
| jq 'select(.name==\"SecurityCenterBuiltIn\")'|jq
'.properties.parameters.jitNetworkAccessMonitoringEffect.value'
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Navigate to `Azure Policy`
    2. On Policy \"Overview\" blade, Click on Policy `ASC Default
(Subscription:Subscription_ID)`
    3. On \"ASC Default\" blade, Click on `Edit Assignments`
    4. In section `PARAMETERS`, Set `Monitor JIT Network Access` to
`AuditIfNotExists` or any other available value than `Disabled`
    5. Click `Save`
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SC-7(5)", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["9.4", "Rev_7"]
  tag cis_rid: "2.12"
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

