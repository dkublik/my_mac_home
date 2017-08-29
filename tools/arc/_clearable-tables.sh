declare -A arc_clearable_tables
arc_clearable_tables=( ["localization_dictionaries"]=""
 ["assets"]="asset_field_values,asset_relations,asset_spoken_languages,asset_written_languages,asset_sign_languages,assets,audit_asset_field_values,audit_asset_relations,audit_asset_spoken_languages,audit_asset_written_languages,audit_asset_sign_languages,audit_assets"
 ["content"]="content_description_suitabilities,suitabilities,content_descr_record_field_value_transls,content_descr_record_content_relations,content_descr_record_field_values,content_version_descr_records,content_descr_records,content_version_asset_relations,content_versions,content,assets,sources_to_delete_queue,sources_to_delete_rel_queue,audit_content_description_suitabilities,audit_suitabilities,audit_content_descr_record_field_value_transls,audit_content_descr_record_content_relations,audit_content_descr_record_field_values,audit_content_version_descr_records,audit_content_descr_records,audit_content_version_asset_relations,audit_content_versions,audit_content,audit_assets,audit_sources_to_delete_queue,audit_sources_to_delete_rel_queue" 
 ["scheduling"]="distr_point_content_descr_record_schedules,schedule_changed_notification,audit_distr_points,audit_stages,audit_schedule_changed_notification,audit_distr_point_content_descr_record_schedules"
 ["delivery"]="content_schedules,content_relations,content_asset_relations,content,assets,audit_assets,audit_content_relations,audit_content_schedules,audit_content_asset_relations,audit_content"
 ["casl_migration"]="dependencies_queue,content_data,bucket_affected_dp_data,id_mappings,delete_synchronization,audit_dependencies_queue,audit_content_data,audit_bucket_affected_dp_data,audit_id_mappings,audit_delete_synchronization" 
)
