control "azure-cis-9.2-control-9.3" do
  title "Ensure web app is using the latest version of TLS encryption"
  desc  "The TLS(Transport Layer Security) protocol secures transmission of
data over the internet using standard encryption technology. Encryption should
be set with the latest version of TLS. App service allows TLS 1.2 by default,
which is the recommended TLS level by industry standards, such as PCI DSS."
  desc  "rationale", "App service currently allows the web app to set TLS
versions 1.0, 1.1 and 1.2. It is highly recommended to use the latest TLS 1.2
version for web app secure connections."
  desc  "check", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `SSL settings`
    5. Ensure that `Minimum TLS Version` set to `1.2` under `Protocol Settings`

    Using Command line:

    To check TLS Version for an existing app, run the following command,
    ```
    az webapp config show --resource-group  --name  --query minTlsVersion
    ```

    The output should return `1.2` if TLS Version is set to `1.2 (Which is
latest now)`.
  "
  desc  "fix", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `SSL settings`
    5. Set `Minimum TLS Version` to `1.2` under `Protocol Settings` section

    Using Command Line:

    To set TLS Version for an existing app, run the following command:
    ```
    az webapp config set --resource-group  --name  --min-tls-version 1.2
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
  tag cis_rid: "9.3"
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

