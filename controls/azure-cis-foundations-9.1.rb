control "azure-cis-foundations-9.1" do
  title "Ensure that 'HTTP Version' is the latest, if used to run the web app"
  desc  "Periodically, newer versions are released for HTTP either due to
security flaws or to include additional functionality. Using the latest HTTP
version for web apps to take advantage of security fixes, if any, and/or new
functionalities of the newer version."
  desc  "rationale", "
    Newer versions may contain security enhancements and additional
functionality. Using the latest version is recommended in order to take
advantage of enhancements and new capabilities. With each software
installation, organizations need to determine if a given update meets their
requirements and also verify the compatibility and support provided for any
additional software against the update revision that is selected.

    HTTP 2.0 has additional performance improvements on the head-of-line
blocking problem of old HTTP version, header compression, and prioritization of
requests. HTTP 2.0 no longer supports HTTP 1.1's chunked transfer encoding
mechanism, as it provides its own, more efficient, mechanisms for data
streaming.
  "
  desc  "check", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `Application settings`
    5. Ensure that `HTTP Version` set to `2.0` version under `General settings`

    NOTE: Most modern browsers support HTTP 2.0 protocol over TLS only, while
non-encrypted traffic continues to use HTTP 1.1. To ensure that client browsers
connect to your app with HTTP/2, either buy an App Service Certificate for your
app's custom domain or bind a third party certificate.

    Using Command line:

    To check HTTP 2.0 version status for an existing app, run the following
command,
    ```
    az webapp config show --resource-group  --name  --query http20Enabled
    ```

    The output should return `true` if TTPS-only traffic value is set to `On`.
  "
  desc  "fix", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `Application settings`
    5. Set `HTTP version` to `2.0` under `General settings`

    NOTE: Most modern browsers support HTTP 2.0 protocol over TLS only, while
non-encrypted traffic continues to use HTTP 1.1. To ensure that client browsers
connect to your app with HTTP/2, either buy an App Service Certificate for your
app's custom domain or bind a third party certificate.

    Using Command Line:

    To set HTTP 2.0 version for an existing app, run the following command:
    ```
    az webapp config set --resource-group  --name  --http20-enabled true
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
  tag nist: ["CM-7 (5)", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["2.2", "Rev_7"]
  tag cis_rid: "9.1"
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

