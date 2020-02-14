control "azure-cis-foundations-2.1" do
  title "Ensure that standard pricing tier is selected"
  desc  "The standard pricing tier enables threat detection for networks and
virtual machines, providing threat intelligence, anomaly detection, and
behavior analytics in the Azure Security Center."
  desc  "rationale", "Enabling the Standard pricing tier allows for greater
defense-in-depth, with threat detection provided by the Microsoft Security
Response Center (MSRC)."
  desc  "check", "
    **Azure Console**

    1. Go to `Azure Security Center`
    2. Select `Security policy` blade
    3. Select each subscription and Click On \"Edit settings\"
    4. Select the `Pricing tier` blade
    5. Review the chosen pricing tier

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command is Standard

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\" GET
https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/pricings?api-version=2017-08-01-preview'
| jq '.|.value[] | select(.name==\"default\")'|jq '.properties.pricingTier'
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Azure Security Center`
    2. Select `Security policy` blade
    3. Click On `Edit Settings` to alter the the security policy for a
subscription
    4. Select the `Pricing tier` blade
    5. Select `Standard`
    6. Select `Save`

    **Azure Command Line Interface 2.0**
    Use the below command to set Pricing Tier to Standard.

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X PUT -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/pricings/default?api-version=2017-08-01-preview
-d@\"input.json\"'

    ```

    Where input.json contains the Request body json data as mentioned below.

    ```
    {
     \"id\": \"/subscriptions//providers/Microsoft.Security/pricings/default\",
     \"name\": \"default\",
     \"type\": \"Microsoft.Security/pricings\",
     \"properties\": {
     \"pricingTier\": \"Standard\"
     }
    }
    ```
  "
  impact 0.7
  tag severity: "high"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SI-3", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["8", "Rev_7"]
  tag cis_rid: "2.1"
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

