control "azure-cis-foundations-8.3" do
  title "Ensure that Resource Locks are set for mission critical Azure
resources"
  desc  "Resource Manager Locks provide a way for administrators to lock down
Azure resources to prevent deletion of, or modifications to, a resource. These
locks sit outside of the Role Based Access Controls (RBAC) hierarchy and, when
applied, will place restrictions on the resource for all users. These are very
useful when there is have an important resource in a subscription that users
should not be able to delete or change and can help prevent accidental and
malicious changes or deletion."
  desc  "rationale", "
    As an administrator, it may be necessary to lock a subscription, resource
group, or resource to prevent other users in the organization from accidentally
deleting or modifying critical resources. The lock level can be set to to
`CanNotDelete` or `ReadOnly` to achieve this purpose.

    - `CanNotDelete` means authorized users can still read and modify a
resource, but they can't delete the resource.

    - `ReadOnly` means authorized users can read a resource, but they can't
delete or update the resource. Applying this lock is similar to restricting all
authorized users to the permissions granted by the Reader role.
  "
  desc  "check", "
    **Azure Console**

    1. Navigate to the specific Azure Resource or Resource Group
    2. Click on `Locks`
    3. Ensure the lock is defined with name and description, type as
`CanNotDelete` or `ReadOnly` as appropriate.

    **Azure Command Line Interface 2.0**

    Review the list of all locks set currently:

    ```
    az lock list --resource-group  --resource-name  --namespace
--resource-type  --parent \"\"
    ```
  "
  desc  "fix", "
    **Azure Console**

    1. Navigate to the specific Azure Resource or Resource Group
    2. For each of the mission critical resource, click on `Locks`
    3. Click `Add`
    4. Give the lock a name and a description, then select the type,
`CanNotDelete` or `ReadOnly` as appropriate

    **Azure Command Line Interface 2.0**

    To lock a resource, provide the name of the resource, its resource type,
and its resource group name.

    ```
    az lock create --name  --lock-type  --resource-group  --resource-name
--resource-type
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
  tag nist: ["AC-6", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["14", "Rev_7"]
  tag cis_rid: "8.3"
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

