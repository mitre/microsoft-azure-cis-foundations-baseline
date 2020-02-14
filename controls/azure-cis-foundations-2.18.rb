control "azure-cis-foundations-2.18" do
  title "Ensure that 'Send email notification for high severity alerts' is set
to 'On'"
  desc  "Enable emailing security alerts to the security contact."
  desc  "rationale", "Enabling security alert emails ensures that security
alert emails are received from Microsoft. This ensures that the right people
are aware of any potential security issues and are able to mitigate the risk."
  desc  "check", "
    **Azure Console**

    1. Go to `Security Center`
    2. Click on `Security Policy`
    3. Click On \"Edit Settings\" for the security policy subscription
    4. Click on `Email notifications`
    5. Ensure that `Send email notification for high severity alerts` is set to
`On`

    **Azure Command Line Interface 2.0**

    Ensure the output of below command is set to `true`.

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X GET -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/securityContacts?api-version=2017-08-01-preview'
| jq '.|.value[] | select(.name==\"default1\")'|jq
'.properties.alertNotifications'
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Security Center`
    2. Click on `Security Policy`
    3. Click On `Edit Settings` for the security policy subscription
    4. Click on `Email notifications`
    5. Set `Send email notification for high severity alerts` to `On`
    6. Click `Save`

    **Azure Command Line Interface 2.0**

    Use the below command to set `Send email notification for high severity
alerts` to `On`.

    ```
    az account get-access-token --query
\"{subscription:subscription,accessToken:accessToken}\" --out tsv | xargs -L1
bash -c 'curl -X PUT -H \"Authorization: Bearer $1\" -H \"Content-Type:
application/json\"
https://management.azure.com/subscriptions/$0/providers/Microsoft.Security/securityContacts/default1?api-version=2017-08-01-preview
-d@\"input.json\"'
    ```

    Where `input.json` contains the Request body json data as mentioned below.
    And replace `validEmailAddress` with email ids csv for multiple and
`phoneNumber` with valid phone number.

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
  tag cis_rid: "2.18"
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

