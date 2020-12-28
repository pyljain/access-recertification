connection: "mybigquery"

# include all the views
include: "/views/**/*.view"

datagroup: access_recertification_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: access_recertification_default_datagroup

explore: access_policy {
  join: access_policy__access_level__custom__expr {
    view_label: "Access Policy: Access Level Custom Expr"
    sql: LEFT JOIN UNNEST([${access_policy__access_level__custom.expr}]) as access_policy__access_level__custom__expr ;;
    relationship: one_to_one
  }

  join: access_policy__access_level {
    view_label: "Access Policy: Access Level"
    sql: LEFT JOIN UNNEST([${access_policy.access_level}]) as access_policy__access_level ;;
    relationship: one_to_one
  }

  join: access_policy__access_level__basic {
    view_label: "Access Policy: Access Level Basic"
    sql: LEFT JOIN UNNEST([${access_policy__access_level.basic}]) as access_policy__access_level__basic ;;
    relationship: one_to_one
  }

  join: access_policy__access_level__basic__conditions__device_policy {
    view_label: "Access Policy: Access Level Basic Conditions Device Policy"
    sql: LEFT JOIN UNNEST([${access_policy__access_level__basic__conditions.device_policy}]) as access_policy__access_level__basic__conditions__device_policy ;;
    relationship: one_to_one
  }

  join: access_policy__access_level__basic__conditions__device_policy__os_constraints {
    view_label: "Access Policy: Access Level Basic Conditions Device Policy Os Constraints"
    sql: LEFT JOIN UNNEST(${access_policy__access_level__basic__conditions__device_policy.os_constraints}) as access_policy__access_level__basic__conditions__device_policy__os_constraints ;;
    relationship: one_to_many
  }

  join: access_policy__access_level__basic__conditions {
    view_label: "Access Policy: Access Level Basic Conditions"
    sql: LEFT JOIN UNNEST(${access_policy__access_level__basic.conditions}) as access_policy__access_level__basic__conditions ;;
    relationship: one_to_many
  }

  join: access_policy__service_perimeter {
    view_label: "Access Policy: Service Perimeter"
    sql: LEFT JOIN UNNEST([${access_policy.service_perimeter}]) as access_policy__service_perimeter ;;
    relationship: one_to_one
  }

  join: access_policy__service_perimeter__spec {
    view_label: "Access Policy: Service Perimeter Spec"
    sql: LEFT JOIN UNNEST([${access_policy__service_perimeter.spec}]) as access_policy__service_perimeter__spec ;;
    relationship: one_to_one
  }

  join: access_policy__service_perimeter__spec__vpc_accessible_services {
    view_label: "Access Policy: Service Perimeter Spec Vpc Accessible Services"
    sql: LEFT JOIN UNNEST([${access_policy__service_perimeter__spec.vpc_accessible_services}]) as access_policy__service_perimeter__spec__vpc_accessible_services ;;
    relationship: one_to_one
  }

  join: access_policy__service_perimeter__status {
    view_label: "Access Policy: Service Perimeter Status"
    sql: LEFT JOIN UNNEST([${access_policy__service_perimeter.status}]) as access_policy__service_perimeter__status ;;
    relationship: one_to_one
  }

  join: access_policy__service_perimeter__status__vpc_accessible_services {
    view_label: "Access Policy: Service Perimeter Status Vpc Accessible Services"
    sql: LEFT JOIN UNNEST([${access_policy__service_perimeter__status.vpc_accessible_services}]) as access_policy__service_perimeter__status__vpc_accessible_services ;;
    relationship: one_to_one
  }

  join: access_policy__access_policy {
    view_label: "Access Policy: Access Policy"
    sql: LEFT JOIN UNNEST([${access_policy.access_policy}]) as access_policy__access_policy ;;
    relationship: one_to_one
  }

  join: access_policy__access_level__custom {
    view_label: "Access Policy: Access Level Custom"
    sql: LEFT JOIN UNNEST([${access_policy__access_level.custom}]) as access_policy__access_level__custom ;;
    relationship: one_to_one
  }
}

explore: iam {
  join: iam__iam_policy__audit_configs {
    view_label: "Iam: Iam Policy Audit Configs"
    sql: LEFT JOIN UNNEST(${iam__iam_policy.audit_configs}) as iam__iam_policy__audit_configs ;;
    relationship: one_to_many
  }

  join: iam__iam_policy__audit_configs__audit_log_configs {
    view_label: "Iam: Iam Policy Audit Configs Audit Log Configs"
    sql: LEFT JOIN UNNEST(${iam__iam_policy__audit_configs.audit_log_configs}) as iam__iam_policy__audit_configs__audit_log_configs ;;
    relationship: one_to_many
  }

  join: iam__iam_policy__bindings__condition {
    view_label: "Iam: Iam Policy Bindings Condition"
    sql: LEFT JOIN UNNEST([${iam__iam_policy__bindings.condition}]) as iam__iam_policy__bindings__condition ;;
    relationship: one_to_one
  }

  join: iam__iam_policy__bindings {
    view_label: "Iam: Iam Policy Bindings"
    sql: LEFT JOIN UNNEST(${iam__iam_policy.bindings}) as iam__iam_policy__bindings ;;
    relationship: one_to_many
  }

  join: iam__iam_policy {
    view_label: "Iam: Iam Policy"
    sql: LEFT JOIN UNNEST([${iam.iam_policy}]) as iam__iam_policy ;;
    relationship: one_to_one
  }
}
