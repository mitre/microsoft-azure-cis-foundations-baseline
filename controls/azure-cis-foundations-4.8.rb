control "azure-cis-9.2-control-4.8" do
  title "Ensure that Azure Active Directory Admin is configured"
  desc  "Use Azure Active Directory Authentication for authentication with SQL
Database."
  desc  "rationale", "
    Azure Active Directory authentication is a mechanism to connect to
Microsoft Azure SQL Database and SQL Data Warehouse using identities in Azure
Active Directory (Azure AD). With Azure AD authentication, identities of
database users and other Microsoft services can be managed in one central
location. Central ID management provides a single place to manage database
users and simplifies permission management.

    - It provides an alternative to SQL Server authentication.
    - Helps stop the proliferation of user identities across database servers.
    - Allows password rotation in a single place.
    - Customers can manage database permissions using external (AAD) groups.
    - It can eliminate storing passwords by enabling integrated Windows
authentication and other forms of authentication supported by Azure Active
Directory.
    - Azure AD authentication uses contained database users to authenticate
identities at the database level.
    - Azure AD supports token-based authentication for applications connecting
to SQL Database.
    - Azure AD authentication supports ADFS (domain federation) or native
user/password authentication for a local Azure Active Directory without domain
synchronization.
    - Azure AD supports connections from SQL Server Management Studio that use
Active Directory Universal Authentication, which includes Multi-Factor
Authentication (MFA). MFA includes strong authentication with a range of easy
verification options — phone call, text message, smart cards with pin, or
mobile app notification.
  "
  desc  "check", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each SQL server, click on `Active Directory admin`
    3. Ensure that an AD account has been populated for field `Active Directory
admin`

    **Azure PowerShell**

    Get the list of all SQL Servers

    ```
    Get-AzureRmSqlServer
    ```

    For each Server

    ```
    Get-AzureRmSqlServerActiveDirectoryAdministrator -ResourceGroupName
-ServerName
    ```

    Ensure Output shows `DisplayName` set to `AD account`.
  "
  desc  "fix", "
    **Azure Console**

    1. Go to `SQL servers`
    2. For each SQL server, click on `Active Directory admin`
    3. Click on `Set admin`
    4. Select an admin
    5. Click `Save`

    **Azure PowerShell**

    For each Server, set AD Admin

    ```
    Set-AzureRmSqlServerActiveDirectoryAdministrator -ResourceGroupName
-ServerName  -DisplayName \"\"
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
  tag nist: ["AC-2", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["16.2", "Rev_7"]
  tag cis_rid: "4.8"
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

