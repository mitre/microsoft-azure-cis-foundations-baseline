control "azure-cis-9.2-control-4.18" do
  title "Ensure server parameter 'log_retention_days' is greater than 3 days
for PostgreSQL Database Server"
  desc  "Enable `log_retention_days` on `PostgreSQL Servers`."
  desc  "rationale", "Enabling `log_retention_days` helps PostgreSQL Database
to `Sets number of days a log file is retained` which in turn generates query
and error logs. Query and error logs can be used to identify, troubleshoot, and
repair configuration errors and sub-optimal performance."
  desc  "check", "
    **Azure Console**

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `Azure Database` for `PostgreSQL server`
    3. For each database, click on `Server parameters`
    4. Search for `log_retention_days`.
    5. Ensure that `value greater than 3`.

    **Azure Command Line Interface 2.0**

    Ensure `log_retention_days` value is greater than 3.

     az postgres server configuration show --resource-group  --server-name
--name log_retention_days
  "
  desc  "fix", "
    **Azure Console**

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `Azure Database` for `PostgreSQL server`
    3. For each database, click on `Server parameters`
    4. Search for `log_retention_days`.
    5. Enter value in range 4-7 (inclusive) and save.

    **Azure Command Line Interface 2.0**

    Use the below command to update `log_retention_days` configuration.

     az postgres server configuration set --resource-group  --server-name
--name log_retention_days --value
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AU-4", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["6.4", "Rev_7"]
  tag cis_rid: "4.18"
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

