view: iam {
  sql_table_name: `recertification_policy_analyser.iam`
    ;;

  dimension: ancestors {
    type: string
    sql: ${TABLE}.ancestors ;;
  }

  dimension: asset_type {
    type: string
    sql: ${TABLE}.asset_type ;;
  }

  dimension: iam_policy {
    hidden: yes
    sql: ${TABLE}.iam_policy ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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

view: iam__iam_policy__audit_configs {
  dimension: audit_log_configs {
    hidden: yes
    sql: ${TABLE}.audit_log_configs ;;
  }

  dimension: service {
    type: string
    sql: ${TABLE}.service ;;
  }
}

view: iam__iam_policy__audit_configs__audit_log_configs {
  dimension: exempted_members {
    type: string
    sql: ${TABLE}.exempted_members ;;
  }

  dimension: log_type {
    type: number
    sql: ${TABLE}.log_type ;;
  }
}

view: iam__iam_policy__bindings__condition {
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

view: iam__iam_policy__bindings {
  dimension: condition {
    hidden: yes
    sql: ${TABLE}.condition ;;
  }

  dimension: members {
    type: string
    sql: ${TABLE}.members ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }
}

view: iam__iam_policy {
  dimension: audit_configs {
    hidden: yes
    sql: ${TABLE}.audit_configs ;;
  }

  dimension: bindings {
    hidden: yes
    sql: ${TABLE}.bindings ;;
  }

  dimension: etag {
    type: string
    sql: ${TABLE}.etag ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }
}
