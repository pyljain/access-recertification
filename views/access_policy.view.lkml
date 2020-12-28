view: access_policy {
  sql_table_name: `recertification_policy_analyser.access_policy`
    ;;

  dimension: access_level {
    hidden: yes
    sql: ${TABLE}.access_level ;;
  }

  dimension: access_policy {
    hidden: yes
    sql: ${TABLE}.access_policy ;;
  }

  dimension: ancestors {
    type: string
    sql: ${TABLE}.ancestors ;;
  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.asset_type ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: service_perimeter {
    hidden: yes
    sql: ${TABLE}.service_perimeter ;;
  }

  dimension_group: update {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.update_time ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}

view: access_policy__access_level__custom__expr {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: expression {
    type: string
    sql: ${TABLE}.expression ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
}

view: access_policy__access_level {
  dimension: basic {
    hidden: yes
    sql: ${TABLE}.basic ;;
  }

  dimension: custom {
    hidden: yes
    sql: ${TABLE}.custom ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
}

view: access_policy__access_level__basic {
  dimension: combining_function {
    type: number
    sql: ${TABLE}.combining_function ;;
  }

  dimension: conditions {
    hidden: yes
    sql: ${TABLE}.conditions ;;
  }
}

view: access_policy__access_level__basic__conditions__device_policy {
  dimension: allowed_device_management_levels {
    type: number
    sql: ${TABLE}.allowed_device_management_levels ;;
  }

  dimension: allowed_encryption_statuses {
    type: number
    sql: ${TABLE}.allowed_encryption_statuses ;;
  }

  dimension: os_constraints {
    hidden: yes
    sql: ${TABLE}.os_constraints ;;
  }

  dimension: require_admin_approval {
    type: yesno
    sql: ${TABLE}.require_admin_approval ;;
  }

  dimension: require_corp_owned {
    type: yesno
    sql: ${TABLE}.require_corp_owned ;;
  }

  dimension: require_screenlock {
    type: yesno
    sql: ${TABLE}.require_screenlock ;;
  }
}

view: access_policy__access_level__basic__conditions__device_policy__os_constraints {
  dimension: minimum_version {
    type: string
    sql: ${TABLE}.minimum_version ;;
  }

  dimension: os_type {
    type: number
    sql: ${TABLE}.os_type ;;
  }

  dimension: require_verified_chrome_os {
    type: yesno
    sql: ${TABLE}.require_verified_chrome_os ;;
  }
}

view: access_policy__access_level__basic__conditions {
  dimension: device_policy {
    hidden: yes
    sql: ${TABLE}.device_policy ;;
  }

  dimension: ip_subnetworks {
    type: string
    sql: ${TABLE}.ip_subnetworks ;;
  }

  dimension: members {
    type: string
    sql: ${TABLE}.members ;;
  }

  dimension: negate {
    type: yesno
    sql: ${TABLE}.negate ;;
  }

  dimension: regions {
    type: string
    sql: ${TABLE}.regions ;;
  }

  dimension: required_access_levels {
    type: string
    sql: ${TABLE}.required_access_levels ;;
  }
}

view: access_policy__service_perimeter {
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: perimeter_type {
    type: number
    sql: ${TABLE}.perimeter_type ;;
  }

  dimension: spec {
    hidden: yes
    sql: ${TABLE}.spec ;;
  }

  dimension: status {
    hidden: yes
    sql: ${TABLE}.status ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: use_explicit_dry_run_spec {
    type: yesno
    sql: ${TABLE}.use_explicit_dry_run_spec ;;
  }
}

view: access_policy__service_perimeter__spec {
  dimension: access_levels {
    type: string
    sql: ${TABLE}.access_levels ;;
  }

  dimension: resources {
    type: string
    sql: ${TABLE}.resources ;;
  }

  dimension: restricted_services {
    type: string
    sql: ${TABLE}.restricted_services ;;
  }

  dimension: vpc_accessible_services {
    hidden: yes
    sql: ${TABLE}.vpc_accessible_services ;;
  }
}

view: access_policy__service_perimeter__spec__vpc_accessible_services {
  dimension: allowed_services {
    type: string
    sql: ${TABLE}.allowed_services ;;
  }

  dimension: enable_restriction {
    type: yesno
    sql: ${TABLE}.enable_restriction ;;
  }
}

view: access_policy__service_perimeter__status {
  dimension: access_levels {
    type: string
    sql: ${TABLE}.access_levels ;;
  }

  dimension: resources {
    type: string
    sql: ${TABLE}.resources ;;
  }

  dimension: restricted_services {
    type: string
    sql: ${TABLE}.restricted_services ;;
  }

  dimension: vpc_accessible_services {
    hidden: yes
    sql: ${TABLE}.vpc_accessible_services ;;
  }
}

view: access_policy__service_perimeter__status__vpc_accessible_services {
  dimension: allowed_services {
    type: string
    sql: ${TABLE}.allowed_services ;;
  }

  dimension: enable_restriction {
    type: yesno
    sql: ${TABLE}.enable_restriction ;;
  }
}

view: access_policy__access_policy {
  dimension: etag {
    type: string
    sql: ${TABLE}.etag ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parent {
    type: string
    sql: ${TABLE}.parent ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
}

view: access_policy__access_level__custom {
  dimension: expr {
    hidden: yes
    sql: ${TABLE}.expr ;;
  }
}
