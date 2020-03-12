control "azure-cis-foundations-4.15" do
  title "Ensure server parameter 'log_disconnections' is set to 'ON' for
PostgreSQL Database Server"
  desc  "Enable `log_disconnections` on `PostgreSQL Servers`."
  desc  "rationale", "Enabling `log_disconnections` helps PostgreSQL Database
to `Logs end of a session`, including duration, which in turn generates query
and error logs. Query and error logs can be used to identify, troubleshoot, and
repair configuration errors and sub-optimal performance."
  desc  "check", "
    **Azure Console**

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `Azure Database` for `PostgreSQL server`
    3. For each database, click on `Server parameters`
    4. Search for `log_disconnections`.
    5. Ensure that value is set to `ON`.

    **Azure Command Line Interface 2.0**

    Ensure `log_connections` value is set to `ON`

     az postgres server configuration show --resource-group  --server-name
--name log_disconnections
  "
  desc  "fix", "
    **Azure Console**

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `Azure Database` for `PostgreSQL server`
    3. For each database, click on `Server parameters`
    4. Search for `log_disconnections`.
    5. Click `ON` and save.

    **Azure Command Line Interface 2.0**

    Use the below command to update `log_disconnections` configuration.

     az postgres server configuration set --resource-group  --server-name
--name log_disconnections --value on
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AU-12", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["6.2", "Rev_7"]
  tag cis_rid: "4.15"
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

