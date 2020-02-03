control 'cis-azure-foundations-6.5' do
    title "Ensure that appropriate logs are being aggregated to a central log management system for analysis and review."
    tag "nist": ['', 'Rev_4']
    desc  "A log profile controls how an activity log is exported. By default, activity logs are retained only for 90 days. Log profiles should be defined so that logs can be exported and stored for a longer duration in order to analyze security activities within an Azure subscription."
    impact 1
    tag "rationale": "A log profile controls how an activity log is exported. By default, activity logs are retained only for 90 days. Log profiles should be defined so that logs can be exported and stored for a longer duration in order to analyze security activities within an Azure subscription."
    tag "cis_impact": ''
    tag "cis_rid": '6.5'
    tag "cis_level": 1
    tag "nist": ['', 'Rev_4']

  
  end