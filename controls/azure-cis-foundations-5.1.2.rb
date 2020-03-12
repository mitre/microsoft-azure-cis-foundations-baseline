control "azure-cis-foundations-5.1.2" do
  title "Ensure that Activity Log Retention is set 365 days or greater"
  desc  "Ensure activity log retention is set for 365 days or greater."
  desc  "rationale", "A log profile controls how the activity log is exported
and retained. Since the average time to detect a breach is 210 days, the
activity log should be retained for 365 days or more in order to have time to
respond to any incidents."
  desc  "check", "
    **Azure Console**

    1. Go to `Activity log`
    2. Select `Export`
    3. Ensure `Retention (days)` is set to `365` OR `Retention (days)` is set
to `0`

    **Azure Command Line Interface 2.0**

    Ensure the below command output contains:
    `days` set `365 or greater` and `enabled` set to `true`

    OR

    `days` set `0` and `enabled` set to `false`

    ```
    az monitor log-profiles list --query [*].retentionPolicy
    ```

    **Note:** Setting the `Retention (days)` to `0` from portal retains the
data forever. Setting `Retention (days)` to 0 from portal sets `days` to `0`
and `enabled` to `false`.
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `Activity log`
    2. Select `Export`
    3. Set `Retention (days)` is set to `365` or `0`
    4. Select `Save`

    **Azure Command Line Interface 2.0**

    Use the below command to set the `Activity log Retention (days)` to `365 or
greater`.

    ```
    az monitor log-profiles update --name  --set retentionPolicy.days=
retentionPolicy.enabled=true
    ```

    Use the below command to store logs for forever (indefinitely).

    ```
    az monitor log-profiles update --name  --set retentionPolicy.days=0
retentionPolicy.enabled=false
    ```

    **Note:**

    - If CLI command returns error by expecting location not set to null,
append `location=global` in the command line. When log profile is set using
azure portal, by default location is set to null and causes error when tried to
update log profile using CLI.
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SI-4 (2)", "AU-4", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["6.5", "6.4", "Rev_7"]
  tag cis_rid: "5.1.2"
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

  describe "This control is not yet implemented. Azure Stack has not yet implemented exporting activity logs from azure stack." do
    skip "This control is not yet implemented. Azure Stack has not yet implemented exporting activity logs from azure stack."
  end
end

