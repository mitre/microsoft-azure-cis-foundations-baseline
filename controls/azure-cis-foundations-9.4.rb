control "azure-cis-9.2-control-9.4" do
  title "Ensure the web app has 'Client Certificates (Incoming client
certificates)' set to 'On'"
  desc  "Client certificates allow for the app to request a certificate for
incoming requests. Only clients that have a valid certificate will be able to
reach the app."
  desc  "rationale", "The TLS mutual authentication technique in enterprise
environments ensures the authenticity of clients to the server. If incoming
client certificates are enabled, then only an authenticated client who has
valid certificates can access the app."
  desc  "check", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `SSL settings`
    5. Ensure that `Incoming client certificates` set to `On` under `Protocol
Settings`

    Using Command line:

    To check Incoming client certificates value for an existing app, run the
following command,
    ```
    az webapp show --resource-group  --name  --query clientCertEnabled
    ```

    The output should return `true` if Incoming client certificates value is
set to `On`.
  "
  desc  "fix", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `SSL settings`
    5. Set `Incoming client certificates` to `On` under `Protocol Settings`
section

    Using Command Line:

    To set Incoming client certificates value for an existing app, run the
following command:
    ```
    az webapp update --resource-group  --name  --set clientCertEnabled=true
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
  tag nist: ["AC-6", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["14", "Rev_7"]
  tag cis_rid: "9.4"
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

