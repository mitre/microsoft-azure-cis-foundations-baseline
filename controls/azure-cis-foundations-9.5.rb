control "azure-cis-9.2-control-9.5" do
  title "Ensure that Register with Azure Active Directory is enabled on App
Service"
  desc  "Managed service identity in App Service makes the app more secure by
eliminating secrets from the app, such as credentials in the connection
strings. When registering with Azure Active Directory in the app service, the
app will connect to other Azure services securely without the need of username
and passwords."
  desc  "rationale", "App Service provides a highly scalable, self-patching web
hosting service in Azure. It also provides a managed identity for apps, which
is a turn-key solution for securing access to Azure SQL Database and other
Azure services."
  desc  "check", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under the `Setting` section, Click on `Identity`
    5. Ensure that `Status` set to `On`

    Using Command line:

    To check Register with Azure Active Directory feature status for an
existing app, run the following command,
    ```
    az webapp identity show --resource-group  --name  --query principalId
    ```

    The output should return unique Principal ID.
    If no output for the above command then Register with Azure Active
Directory is not set.
  "
  desc  "fix", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `Identity`
    5. Set `Status` to `On`

    Using Command Line:

    To set Register with Azure Active Directory feature for an existing app,
run the following command:
    ```
    az webapp identity assign --resource-group  --name
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
  tag nist: ["AC-2", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["16.2", "Rev_7"]
  tag cis_rid: "9.5"
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

