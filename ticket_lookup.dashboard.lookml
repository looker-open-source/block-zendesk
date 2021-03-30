- dashboard: ticket_lookup
  title: Ticket Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Assigned To
    name: Assigned To
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [assignee.name]
    sorts: [assignee.name]
    limit: 1
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Ticket: ticket.id
    row: 0
    col: 10
    width: 5
    height: 2
  - title: Customer
    name: Customer
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [organization.name]
    sorts: [organization.name]
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Ticket: ticket.id
    row: 0
    col: 0
    width: 5
    height: 4
  - title: Requester
    name: Requester
    model: block_zendesk
    explore: ticket
    type: looker_single_record
    fields: [requester.name, requester.email, requester.last_login_time, requester.phone,
      requester.role, requester.time_zone, requester.notes]
    sorts: [requester.name]
    limit: 1
    column_limit: 50
    show_view_names: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Ticket: ticket.id
    row: 0
    col: 5
    width: 5
    height: 4
  - title: Status
    name: Status
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.status]
    sorts: [ticket.status]
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Ticket: ticket.id
    row: 2
    col: 10
    width: 5
    height: 2
  - title: Last Updated
    name: Last Updated
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket_history_fact.last_updated_status_time]
    sorts: [ticket_history_fact.last_updated_status_time desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: days_since_last_updated, label: Days Since
          Last Updated, expression: 'diff_days(${ticket_history_fact.last_updated_status_time},
          now())', value_format: !!null '', value_format_name: decimal_0, _kind_hint: dimension,
        _type_hint: number}]
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Ticket: ticket.id
    row: 4
    col: 10
    width: 5
    height: 4
  - title: Open in Zendesk
    name: Open in Zendesk
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.id_direct_link]
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Ticket: ticket.id_direct_link
    row: 4
    col: 0
    width: 5
    height: 4
  - title: Number of Open Tickets
    name: Number of Open Tickets
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [requester_facts.number_of_open_tickets]
    limit: 1
    column_limit: 50
    show_view_names: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Ticket: ticket.id
    row: 4
    col: 5
    width: 5
    height: 4
  - title: Comments
    name: Comments
    model: block_zendesk
    explore: ticket
    type: table
    fields: [ticket_comment.created_time, ticket_comment.body]
    sorts: [ticket_comment.created_time]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Ticket: ticket.id
    row: 8
    col: 0
    width: 24
    height: 7
  - title: Comments Over Time
    name: Comments Over Time
    model: block_zendesk
    explore: ticket
    type: looker_column
    fields: [ticket_comment.count, ticket_comment.created_week]
    fill_fields: [ticket_comment.created_week]
    sorts: [ticket_comment.created_week desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - ticket_comment.count,
            id: No - ticket_comment.count, name: Customer}, {axisId: Yes - ticket_comment.count,
            id: Yes - ticket_comment.count, name: Assignee}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    series_labels:
      No - ticket_comment.count: Customer
      Yes - ticket_comment.count: Assignee
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Ticket: ticket.id
    row: 0
    col: 15
    width: 9
    height: 8
  - title: Previous Tickets with This Account
    name: Previous Tickets with This Account
    model: block_zendesk
    explore: ticket
    type: table
    fields: [requester_previous_tickets.id, requester_previous_tickets.status, requester_previous_tickets.created_date,
      requester_previous_tickets.description]
    sorts: [requester_previous_tickets.created_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Ticket: ticket.id
    row: 15
    col: 0
    width: 24
    height: 8
  filters:
  - name: Ticket
    title: Ticket
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: block_zendesk
    explore: ticket
    listens_to_filters: []
    field: ticket.id
