control "azure-cis-foundations-3.4" do
  title "Ensure that shared access signature tokens expire within an hour"
  desc  "Expire shared access signature tokens within an hour."
  desc  "rationale", "A shared access signature (SAS) is a URI that grants
restricted access rights to Azure Storage resources. A shared access signature
can be provided to clients who should not be trusted with the storage account
key but for whom it may be necessary to delegate access to certain storage
account resources. Providing a shared access signature URI to these clients
allows them access to a resource for a specified period of time. This time
should be set as low as possible and preferably no longer than an hour."
  desc  "check", "Currently, SAS token expiration times cannot be audited.
Until Microsoft makes token expiration time a setting rather than a token
creation parameter, this recommendation would require a manual verification."
  desc  "fix", "When generating shared access signature tokens, use start and
end time such that it falls within an hour."
  impact 0.5
  tag severity: "medium"
  tag gtitle: nil
  tag gid: nil
  tag rid: nil
  tag stig_id: nil
  tag fix_id: nil
  tag cci: nil
  tag nist: [nil, "Rev_4"]
  tag cis_level: 1
  tag cis_controls: ["16.10", "Rev_7"]
  tag cis_rid: "3.4"
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

  describe "Currently, SAS token expiration times cannot be audited. Until Microsoft makes token expiration time a setting rather than a token creation parameter, this recommendation would require a manual verification." do
    skip "Currently, SAS token expiration times cannot be audited. Until Microsoft makes token expiration time a setting rather than a token creation parameter, this recommendation would require a manual verification."
  end
end

