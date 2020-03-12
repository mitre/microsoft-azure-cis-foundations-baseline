control "azure-cis-9.2-control-2.16" do
  title "Ensure that 'Security contact emails' is set"
  desc  "Provide a security contact email address."
  desc  "rationale", "Microsoft reaches out to the designated security contact
in case its security team finds that the organization's resources are
compromised. This ensures that the proper people are aware of any potential
compromise in order to mitigate the risk in a timely fashion."
  desc  "check", "
    **Azure Console**

    1. Go to `Security Center`
    2. Click on `Security Policy`
    3. Click on `Edit Settings` for the security policy subscription
    4. Click on `Email notifications`
    5. Ensure that a valid security contact email address is set

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command is set not empty and is set with
appropriate email ids.

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/securityContacts?api-version=2017-08-01-preview'
| jq '.|.value[] | select(.name==\"default1\")'|jq '.properties.email'
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Security Center`
    2. Click on `Security Policy`
    3. Click On `Edit Settings` for the security policy subscription
    4. Click on `Email notifications`
    5. Set a valid email address for the security contact
    6. Click `Save`

    **Azure Command Line Interface 2.0**

    Use the below command to set `Security contact emails` to `On`.

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X PUT -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/securityContacts/default1?api-version=2017-08-01-preview
-d@\"input.json\"'
    ```

    Where `input.json` contains the Request body json data as mentioned below.
And replace validEmailAddress with email ids csv for multiple.

    ```
     {
     \"id\":
\"/subscriptions//providers/Microsoft.Security/securityContacts/default1\",
     \"name\": \"default1\",
     \"type\": \"Microsoft.Security/securityContacts\",
     \"properties\": {
     \"email\": \"\",
     \"phone\": \"

    \t\",
     \"alertNotifications\": \"On\",
     \"alertsToAdmins\": \"On\"
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
  tag cis_controls: ["3", "Rev_7"]
  tag cis_rid: "2.16"
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

