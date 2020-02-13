control "azure-cis-9.2-control-4.17" do
  title "Ensure server parameter 'connection_throttling' is set to 'ON' for
PostgreSQL Database Server"
  desc  "Enable `connection_throttling` on `PostgreSQL Servers`."
  desc  "rationale", "Enabling `connection_throttling` helps the PostgreSQL
Database to `Set the verbosity of logged messages` which in turn generates
query and error logs with respect to concurrent connections, that could lead to
a successful Denial of Service (DoS) attack by exhausting connection resources.
A system can also fail or be degraded by an overload of legitimate users. Query
and error logs can be used to identify, troubleshoot, and repair configuration
errors and sub-optimal performance."
  desc  "check", "
    **Azure Console**

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `Azure Database` for `PostgreSQL server`
    3. For each database, click on `Server parameters`
    4. Search for `connection_throttling`.
    5. Ensure that value is set to `ON`.

    **Azure Command Line Interface 2.0**

    Ensure `connection_throttling` value is set to `ON`

     az postgres server configuration show --resource-group  --server-name
--name connection_throttling
  "
  desc  "fix", "
    **Azure Console**

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `Azure Database` for `PostgreSQL server`
    3. For each database, click on `Server parameters`
    4. Search for `connection_throttling`.
    5. Click `ON` and save.

    **Azure Command Line Interface 2.0**

    Use the below command to update `connection_throttling` configuration.

     az postgres server configuration set --resource-group  --server-name
--name connection_throttling --value on
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
  tag cis_rid: "4.17"
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

