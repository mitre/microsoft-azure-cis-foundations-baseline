control "azure-cis-9.2-control-2.2" do
  title "Ensure that 'Automatic provisioning of monitoring agent' is set to
'On'"
  desc  "Enable automatic provisioning of the monitoring agent to collect
security data."
  desc  "rationale", "When `Automatic provisioning of monitoring agent` is
turned on, Azure Security Center provisions the Microsoft Monitoring Agent on
all existing supported Azure virtual machines and any new ones that are
created. The Microsoft Monitoring Agent scans for various security-related
configurations and events such as system updates, OS vulnerabilities, endpoint
protection, and provides alerts."
  desc  "check", "
    **Azure Console**

    1. Go to `Security Center`
    2. Click on `Security Policy`
    3. Click on `Edit Settings` each subscription
    4. Click on `Data Collection`
    5. Ensure that `Automatic provisioning of monitoring agent` is set to `On`

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command is `On`

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/autoProvisioningSettings?api-version=2017-08-01-preview'
| jq '.|.value[] | select(.name==\"default\")'|jq '.properties.autoProvision'
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Security Center`
    2. Click on `Security Policy`
    3. Click On \"Edit Settings\" for each subscription
    4. Click on `Data Collection`
    5. Set `Automatic provisioning of monitoring agent` to `On`
    6. Click `Save`

    **Azure Command Line Interface 2.0**

    Use the below command to set `Automatic provisioning of monitoring agent`
to `On`.

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X PUT -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/autoProvisioningSettings/default?api-version=2017-08-01-preview
-d@\"input.json\"'
    ```

    Where `input.json` contains the Request body json data as mentioned below.
    ```
     {
     \"id\":
\"/subscriptions//providers/Microsoft.Security/autoProvisioningSettings/default\",
     \"name\": \"default\",
     \"type\": \"Microsoft.Security/autoProvisioningSettings\",
     \"properties\": {
     \"autoProvision\": \"On\"
     }
    }
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
  tag nist: ["RA-5", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["3.1", "Rev_7"]
  tag cis_rid: "2.2"
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

