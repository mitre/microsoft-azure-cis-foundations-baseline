control "azure-cis-9.2-control-9.2" do
  title "Ensure web app redirects all HTTP traffic to HTTPS in Azure App
Service"
  desc  "Azure Web Apps allows sites to run under both HTTP and HTTPS by
default. Web apps can be accessed by anyone using non-secure HTTP links by
default.
    Non-secure HTTP requests can be restricted and all HTTP requests redirected
to the secure HTTPS port. It is recommended to enforce HTTPS-only traffic.
  "
  desc  "rationale", "Enabling HTTPS-only traffic will redirect all non-secure
HTTP request to HTTPS ports. HTTPS uses the SSL/TLS protocol to provide a
secure connection, which is both encrypted and authenticated. So it is
important to support HTTPS for the security benefits."
  desc  "check", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `SSL settings`
    5. Ensure that `HTTPS Only` set to `On` under `Protocol Settings`

    Using Command line:

    To check HTTPS-only traffic value for an existing app, run the following
command,
    ```
    az webapp show --resource-group  --name  --query httpsOnly
    ```

    The output should return `true` if TTPS-only traffic value is set to `On`.
  "
  desc  "fix", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `SSL settings`
    5. Set `HTTPS Only` to `On` under `Protocol Settings` section

    Using Command Line:

    To set HTTPS-only traffic value for an existing app, run the following
command:
    ```
    az webapp update --resource-group  --name  --set httpsOnly=false
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
  tag nist: ["SI-3", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["7", "Rev_7"]
  tag cis_rid: "9.2"
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

  describe "This control has not been implemented yet. App Services is an Azure Cloud offering and has not yet been implemented for Azure Stack." do
    skip "This control has not been implemented yet. App Services is an Azure Cloud offering and has not yet been implemented for Azure Stack."
  end
end

