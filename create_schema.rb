require_relative 'setup'

DB.create_table(:clinical_study) do
  String :nct_id, size: 50, primary_key: true, null: false
  Date :download_date
  Date :download_date_dt
  String :org_study_id, size: 100
  String :brief_title, size: 1000
  String :official_title, size: 1000
  String :acronym, size: 250
  String :source, size: 200
  String :has_dmc, size: 10
  String :brief_summary, text: true
  String :detailed_description, text: true
  String :overall_status, size: 200
  Date :start_date
  Date :completion_date
  String :completion_date_type, size: 50
  Date :primary_completion_date
  String :primary_completion_date_type, size: 50
  String :phase, size: 50
  String :study_type, size: 200
  String :study_design, size: 2000
  Integer :number_of_arms
  Integer :number_of_groups
  String :enrollment_type, size: 50
  Integer :enrollment
  String :biospec_retention, size: 50
  String :biospec_descr, size: 2000
  String :criteria, text: true
  String :gender, size: 50
  String :minimum_age, size: 50
  String :maximum_age, size: 50
  String :healthy_volunteers, size: 50
  String :sampling_method, size: 100
  String :study_pop, size: 2000
  Date :verification_date
  Date :lastchanged_date
  Date :firstreceived_date
  String :is_section_801, size: 50
  String :is_fda_regulated, size: 50
  String :why_stopped, size: 1000
  String :has_expanded_access, size: 50
  Date :firstreceived_results_date
  String :url, size: 250
  String :target_duration, size: 250
  String :study_rank, size: 50
  String :limitations_and_caveats, size: 2000
end

DB.create_table(:facilities) do
  Integer :facility_id, primary_key: true, null: false
  String :nct_id, size: 50, null: false
  foreign_key [:nct_id], :clinical_study
  String :status, size: 50
  String :facility_name, size: 500
  String :city, size: 100
  String :state, size: 100
  String :zip, size: 50
  String :country, size: 50
end

DB.create_table(:facility_contacts) do
  Integer :facility_contact_id, primary_key: true, null: false
  Integer :facility_id, null: false
  String :nct_id, size: 50, null: false
  String :contact_type, size: 100
  String :name_degree, size: 150
  String :phone, size: 50
  String :phone_ext, size: 50
  String :email, size: 200
  foreign_key [:facility_id], :facilities
end

DB.create_table(:investigators) do
  Integer :investigator_id, primary_key: true, null: false
  Integer :facility_id, null: false
  String :nct_id, size: 50, null: false
  String :name_degree, size: 150
  String :role, size: 100
  String :affiliation, size: 500
  foreign_key [:facility_id], :facilities
end

DB.create_table(:central_contacts) do
  Integer :central_contact_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :contact_type, size: 100
  String :name_degree, size: 150
  String :phone, size: 50
  String :phone_ext, size: 50
  String :email, size: 200
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:overall_officials) do
  Integer :overall_official_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :role, size: 100
  String :name_degree, size: 150
  String :affiliation, size: 300
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:nct_aliases) do
  Integer :nct_alias_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :nct_alias, size: 200
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:links) do
  Integer :link_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :url, size: 500
  String :description, size: 300
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:sponsors) do
  Integer :sponsor_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :sponsor_type, size: 50
  String :agency, size: 200
  String :agency_class, size: 50
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:designs) do
  Integer :design_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :design_name, size: 500
  String :design_value, size: 500
  String :masked_role, size: 100
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:responsible_parties) do
  Integer :responsible_party_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :name_title, size: 300
  String :organization, size: 250
  String :responsible_party_type, size: 50
  String :investigator_affiliation, size: 300
  String :investigator_full_name, size: 300
  String :investigator_title, size: 300
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:keywords) do
  Integer :keyword_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :keyword, size: 200
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:references) do
  Integer :reference_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :reference_type, size: 50
  String :citation, text: true
  String :pmid, size: 20
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:conditions) do
  Integer :condition_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :condition, size: 200
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:secondary_ids) do
  Integer :sec_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :secondary_id, size: 100
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:interventions) do
  Integer :intervention_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :intervention_type, size: 100
  String :intervention_name, size: 500
  String :description, size: 2000
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:intervention_other_names) do
  Integer :int_other_name_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  Integer :intervention_id
  String :other_name, size: 500
  foreign_key [:nct_id], :clinical_study
  foreign_key [:intervention_id], :interventions
end

DB.create_table(:intervention_arm_groups) do
  Integer :int_arm_group_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  Integer :intervention_id
  String :arm_group_label, size: 100
  foreign_key [:nct_id], :clinical_study
  foreign_key [:intervention_id], :interventions
end

DB.create_table(:removed_countries) do
  Integer :removed_countries_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :country, size: 50
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:location_countries) do
  Integer :location_countries_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :country, size: 50
  foreign_key [:nct_id], :clinical_study
end

DB.create_table(:authorities) do
  Integer :authority_id, null: false, primary_key: true
  String :nct_id, size: 50, null: false
  String :authority, size: 300
  foreign_key [:nct_id], :clinical_study
end

DB.disconnect
