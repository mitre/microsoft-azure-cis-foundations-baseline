control "azure-cis-foundations-4.6" do
  title "Ensure that 'Send alerts to' is set"
  desc  "Provide the email address where alerts will be sent when anomalous
activities are detected on SQL servers."
  desc  "rationale", "Providing the email address to receive alerts ensures
that any detection of anomalous activities is reported as soon as possible,
making it more likely to mitigate any potential risk sooner."
  desc  "check", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Advanced Data Security`
    4. At section Threat Detection Settings, Ensure that `Send alerts to` is
set as appropriate.

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```
    Get-AzureRmSqlServer
    ```

    For each Server

    ```
    Get-AzureRmSqlServerThreatDetectionPolicy -ResourceGroupName  -ServerName
    ```

    Ensure that `NotificationRecipientsEmails` is set to the `recipient email
id`.
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each server instance
    3. Click on `Advanced Threat Protection`
    4. Set `Send alerts to` as appropriate

    **Azure PowerShell**

    For each Server, set `Send alerts to`

    ```
    Set-AzureRmSqlServerThreatDetectionPolicy -ResourceGroupName  -ServerName
-NotificationRecipientsEmails \"\"
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
  tag nist: ["IR-2", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["19", "Rev_7"]
  tag cis_rid: "4.6"
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

  describe "This control is not yet implemented. Azure Stack has not yet implemented sql databases as a service." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented sql databases as a service."
  end
end

