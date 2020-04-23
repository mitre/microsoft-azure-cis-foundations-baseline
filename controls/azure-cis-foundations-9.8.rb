control "azure-cis-foundations-9.8" do
  title "Ensure that 'Python version' is the latest, if used to run the web app"
  desc  "Periodically, newer versions are released for Python software either
due to security flaws or to include additional functionality. Using the latest
Python version for web apps is recommended in order to take advantage of
security fixes, if any, and/or additional functionalities of the newer version."
  desc  "rationale", "Newer versions may contain security enhancements and
additional functionality. Using the latest software version is recommended in
order to take advantage of enhancements and new capabilities. With each
software installation, organizations need to determine if a given update meets
their requirements and also verify the compatibility and support provided for
any additional software against the update revision that is selected."
  desc  "check", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `Application settings`
    5. Ensure that `Python version` set to the latest version available under
`General settings`

    NOTE: No action is required, If `Python version` is set to `Off` as Python
is not used by your web app.

    Using Command line:

    To check Python version for an existing app, run the following command,
    ```
    az webapp config show --resource-group  --name  --query pythonVersion
    ```

    The output should return the latest available version of Python.

    NOTE: No action is required, If the output is empty as Python is not used
by your web app.
  "
  desc  "fix", "
    Using Console:

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `App Services`
    3. Click on each App
    4. Under `Setting` section, Click on `Application settings`
    5. Set `Python version` to latest version available under `General settings`

    NOTE: No action is required, If `Python version` is set to `Off` as Python
is not used by your web app.

    Using Command Line:

    To see the list of supported runtimes:
    ```
    az webapp list-runtimes | grep python
    ```

    To set latest Python version for an existing app, run the following command:
    ```
    az webapp config set --resource-group  --name  --python-version
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
  tag cis_rid: "9.8"
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

