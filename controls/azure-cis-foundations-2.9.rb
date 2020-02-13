control "azure-cis-9.2-control-2.9" do
  title "Ensure ASC Default policy setting \"Enable Next Generation
Firewall(NGFW) Monitoring\" is not \"Disabled\""
  desc  "Enable next generation firewall recommendations for virtual machines."
  desc  "rationale", "When this setting is enabled, it extends network
protections beyond network security groups, which are built into Azure.
Security Center will search for deployments where a next generation firewall is
recommended and enable a virtual appliance to be provisioned."
  desc  "check", "
    **Azure Console**

    1. Go to Azure Security Center
    2. Click On the `security policy` to Open Policy Management Blade.
    3. Click `Subscription View`
    4. Click on `Subscription Name` to open Security Policy Blade for the
Subscription.
    5. Expand `Network`
    6. Ensure that `Next generation firewall` is not set to `Disabled`

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command is not `Disabled` or Empty

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn?api-version=2018-05-01'
| jq 'select(.name==\"SecurityCenterBuiltIn\")'|jq
'.properties.parameters.nextGenerationFirewallMonitoringEffect.value'
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Navigate to `Azure Policy`
    2. On Policy \"Overview\" blade, Click on Policy `ASC Default
(Subscription:Subscription_ID)`
    3. On \"ASC Default\" blade, Click on `Edit Assignments`
    4. In section `PARAMETERS`, Set `Enable Next Generation Firewall(NGFW)
Monitoring` to `AuditIfNotExists` or any other available value than `Disabled`
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
  tag nist: ["CM-6", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["11", "Rev_7"]
  tag cis_rid: "2.9"
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

