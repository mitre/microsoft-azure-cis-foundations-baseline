control "azure-cis-9.2-control-9.6" do
  title "Ensure that '.Net Framework' version is the latest, if used as a part
of the web app"
  desc  "Periodically, newer versions are released for .Net Framework software
either due to security flaws or to include additional functionality. Using the
latest .Net framework version for web apps is recommended in order to to take
advantage of security fixes, if any, and/or new functionalities of the latest
version."
  desc  "rationale", "Newer versions may contain security enhancements and
additional functionality. It is recommended to use the latest software version
to take advantage of enhancements and new capabilities. With each software
installation, organizations need to determine if a given update meets their
requirements and also verify the compatibility and support provided for any
additional software against the update revision that is selected."
  desc  "check", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `Application settings`
    5. Ensure that `.NET Framework version` set to latest version available
under `General settings`

    Using Command line:

    To check .NET Framework version for an existing app, run the following
command,
    ```
    az webapp config show --resource-group  --name  --query netFrameworkVersion
    ```

    The output should return latest available version of .Net framework.
  "
  desc  "fix", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `Application settings`
    5. Set `.NET Framework version` to latest version available under `General
settings`

    Using Command Line:

    To see the list of supported runtimes:

    ```
    az webapp list-runtimes | grep aspnet
    ```

    To set latest .NET Framework version for an existing app, run the following
command:
    ```
    az webapp config set --resource-group  --name  --net-framework-version
    ```
    Use .NET Framework as, 'v4.0' for .NET 4.6 and 'v3.0' for .NET 3.5.
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
  tag cis_rid: "9.6"
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

