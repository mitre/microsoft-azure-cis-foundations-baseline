control "azure-cis-9.3-control-1.1" do
  title "Ensure that multi-factor authentication is enabled for all privileged users"
  desc  "Enable multi-factor authentication for all user credentials who have write access to Azure resources. These include roles like
   Service Co-Administrators
   Subscription Owners
   Contributors"
  desc  "rationale", "Multi-factor authentication requires an individual to present a minimum of two separate forms of authentication before access is granted. Multi-factor authentication provides additional assurance that the individual attempting to gain access is who they claim to be. With multi-factor authentication, an attacker would need to compromise at least two different authentication mechanisms, increasing the difficulty of compromise and thus reducing the risk."
  desc  "check", "
    **Azure Console**
    
    1. Go to `Azure Active Directory`
    2. Go to `Users and group`
    3. Go to `All Users`
    4. Click on `Multi-Factor Authentication` button on the top bar
    5. Ensure that `MULTI-FACTOR AUTH STATUS` is `Enabled` for all users who are `Service
    Co-Administrators` OR `Owners` OR `Contributors`.
  
    **Microsoft Graph API**
    For Every Subscription, For Every Tenant

    **Step 1**: Identify Users with Administrative Access

    A> List All Users Using Microsoft Graph API:
    ```
    GET https://graph.microsoft.com/v1.0/users
    ```
    Capture `id` and corresponding `userPrincipalName` (`$uid`, `$userPrincipalName`)
    
    B> List all Role Definitions Using Azure management API:
    ```
    https://management.azure.com/subscriptions/:subscriptionId/providers/Microsof t.Authorization/roleDefinitions?api-version=2017-05-01
    ```
    Capture Role Definition IDs/Name (`$name`) and role names (`$properties/roleName`) where `properties/roleName` contains (`Owner` or `*contributor` or `admin`)

    C> List All Role Assignments (Mappings `$A.uid` to `$B.name`) Using Azure Management API:
    ```
    GET https://management.azure.com/subscriptions/:subscriptionId/providers/Microsof t.Authorization/roleassignments?api-version=2017-10-01-preview
    ```
    Find all administrative roles (`$B.name`) in `Properties/roleDefinationId` mapped with user ids (`$A.id`) in `Properties/principalId` where `Properties/principalType == User`
    
    D> Now Match (`$CProperties/principalId`) with `$A.uid` and get `$A.userPrincipalName` save this as `D.userPrincipleName`

    **Step 2**: Run MSOL Powershell command:
    ```
    Get-MsolUser -All | where {$_.StrongAuthenticationMethods.Count -eq 0} | Select-Object -Property UserPrincipalName
    ```

    If the output contains any of the `$D.userPrincipleName`, then this recommendation is non- compliant.
    
    Please note that at this point of time, there is no API/CLI mechanism available to programmatically conduct security assessment for this recommendation. Only option is MSOL
  "
  desc  "fix", "Follow Microsoft Azure documentation and setup multi-factor authentication in your environment."
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
  tag cis_controls: ["4.5", "Rev_7"]
  tag cis_rid: "1.3"
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

  describe "At this point of time, there is no API/CLI mechanism available to programmatically conduct security assessment for this recommendation. Only option is MSOL." do
    skip "At this point of time, there is no API/CLI mechanism available to programmatically conduct security assessment for this recommendation. Only option is MSOL."
  end
end

