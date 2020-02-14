control "azure-cis-foundations-8.5" do
  title "Enable role-based access control (RBAC) within Azure Kubernetes
Services"
  desc  "Ensure that RBAC is enabled on all Azure Kubernetes Services Instances"
  desc  "rationale", "Azure Kubernetes Services has the capability to integrate
Azure Active Directory users and groups into Kubernetes RBAC controls within
the AKS Kubernetes API Server. This should be utilized to enable granular
access to Kubernetes resources within the AKS clusters supporting RBAC controls
not just of the overarching AKS instance but also the individual resources
managed within Kubernetes."
  desc  "check", "
    Azure Console
    1. Go to Kubernetes Services
    2. For each Kubernetes Services instance, click on Automation Script.
    3. Ensure that each variable \"enableRBAC\" is set to true.

    Azure Command Line Interface 2.0
    Ensure that the output of the below command is not empty or null.
    ```
    az aks show --name  --query enableRbac --resource-group  --subscription
    ```
  "
  desc  "fix", "WARNING: This setting cannot be changed after AKS deployment,
cluster will require recreation."
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: ["AC-6", "AC-6", "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["4", "14", "Rev_7"]
  tag cis_rid: "8.5"
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

