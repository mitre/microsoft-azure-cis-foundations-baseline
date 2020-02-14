control "azure-cis-foundations-2.13" do
  title "Ensure ASC Default policy setting \"Monitor Adaptive Application
Whitelisting\" is not \"Disabled\""
  desc  "Enable adaptive application controls."
  desc  "rationale", "Adaptive application controls help control which
applications can run on VMs located in Azure, which among other benefits helps
harden those VMs against malware. The Security Center uses machine learning to
analyze the processes running in the VM and helps to apply white-listing rules
using this intelligence."
  desc  "check", "
    **Azure Console**

    1. Go to Azure Security Center
    2. Click On the `security policy` to Open Policy Management Blade.
    3. Click `Subscription View`
    4. Click on `Subscription Name` to open Security Policy Blade for the
Subscription.
    5. Expand `Compute and Apps`
    6. Ensure that `Adaptive Application controls` is not set to `Disabled`

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command is not `Disabled` or Empty

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn?api-version=2018-05-01'
| jq 'select(.name==\"SecurityCenterBuiltIn\")'|jq
'.properties.parameters.adaptiveApplicationControlsMonitoringEffect.value'
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Navigate to `Azure Policy`
    2. On Policy \"Overview\" blade, Click on Policy `ASC Default
(Subscription:Subscription_ID)`
    3. On \"ASC Default\" blade, Click on `Edit Assignments`
    4. In section `PARAMETERS`, Set `Monitor Application Whitelisting` to
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
  tag nist: ["CM-7 (2)", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["2.7", "Rev_7"]
  tag cis_rid: "2.13"
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

