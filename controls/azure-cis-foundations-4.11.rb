control "azure-cis-foundations-4.11" do
  title "Ensure 'Enforce SSL connection' is set to 'ENABLED' for MySQL Database
Server"
  desc  "Enable `SSL connection` on `MYSQL` Servers."
  desc  "rationale", "SSL connectivity helps to provide a new layer of
security, by connecting database server to client applications using Secure
Sockets Layer (SSL). Enforcing SSL connections between database server and
client applications helps protect against \"man in the middle\" attacks by
encrypting the data stream between the server and application."
  desc  "check", "
    **Azure Console**

    1. Login to Azure Portal using https://portal.azure- list text here.com
    2. Go to `Azure Database` for `MySQL server`
    3. For each database, click on `Connection security`
    4. In `SSL` settings
    5. Ensure `Enforce SSL connection` is set to `ENABLED`.

    **Azure Command Line Interface 2.0**

    Ensure the output of the below command returns ENABLED.

     az mysql server show --resource-group myresourcegroup --name  --query
sslEnforcement
  "
  desc  "fix", "
    **Azure Console**

    1. Login to Azure Portal using https://portal.azure.com
    2. Go to `Azure Database` for `MySQL server`
    3. For each database, click on `Connection security`
    4. In `SSL` settings
    5. Click on `ENABLED` for `Enforce SSL connection`

    **Azure Command Line Interface 2.0**

    Use the below command to set MYSQL Databases to Enforce SSL connection.

     az mysql server update --resource-group  --name  --ssl-enforcement Enabled
  "
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["SC-8", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["14.4", "Rev_7"]
  tag cis_rid: "4.11"
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

