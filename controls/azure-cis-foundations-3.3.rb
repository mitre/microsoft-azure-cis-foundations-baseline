control "azure-cis-9.2-control-3.3" do
  title "Ensure Storage logging is enabled for Queue service for read, write,
and delete requests"
  desc  "The Storage Queue service stores messages that may be read by any
client who has access to the storage account. A queue can contain an unlimited
number of messages, each of which can be up to 64KB in size using version
2011-08-18 or newer. Storage Logging happens server-side and allows details for
both successful and failed requests to be recorded in the storage account.
These logs allow users to see the details of read, write, and delete operations
against the queues. Storage Logging log entries contain the following
information about individual requests: Timing information such as start time,
end-to-end latency, and server latency, authentication details , concurrency
information and the sizes of the request and response messages."
  desc  "rationale", "
    Storage Analytics logs contain detailed information about successful and
failed requests to a storage service. This information can be used to monitor
individual requests and to diagnose issues with a storage service. Requests are
logged on a best-effort basis.

    Storage Analytics logging is not enabled by default for your storage
account.
  "
  desc  "check", "
    - Go to `Storage Accounts`.
    - Select the specific Storage Account.
    - Use the `Diagnostics logs (classic)` blade from `Monitoring (classic)`
section.
    - Ensure the `Status` is set to `On`, if set to `Off`.
    - Select `Queue properties`.
    - Ensure `Read` `Write` `Delete` options are selected under the `Logging`
section.

    Via CLI :

    Ensure the below command's output contains properties `delete`, `read` and
`write` set to `true`.

    ```
    az storage logging show --services q --account-name
    ```
  "
  desc  "fix", "
    - Go to `Storage Accounts`.
    - Select the specific Storage Account.
    - Use the `Diagnostics logs (classic)` blade from `Monitoring (classic)`
section.
    - Set the `Status` to `On`, if set to `Off`.
    - Select `Queue properties`.
    - Select `Read`, `Write` and `Delete` options under the `Logging` section
to enable Storage Logging for Queue service.

    Via CLI :

    Use the below command to enable the Storage Logging for Queue service.

    ```
    az storage logging update --account-name  --account-key  --services q --log
rwd --retention 90
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
  tag nist: ["AU-3", "Rev_4"]
  tag cis_level: 2
  tag cis_controls: ["6.3", "Rev_7"]
  tag cis_rid: "3.3"
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

