- dashboard: agent_dashboard
  title: Agent Dashboard
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Open Tickets
    name: Open Tickets
    model: block_zendesk
    explore: ticket
    type: table
    fields: [ticket.created_date, ticket.ticket_link, ticket.priority, ticket.subject,
      requester.name, organization.name, requester.email, ticket.days_open, ticket.updated_date]
    filters:
      ticket.id: ''
      ticket.status: "-closed"
    sorts: [ticket.priority desc, ticket.days_open desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      ticket.ticket_link: Ticket Number
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: normal
    trellis: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_types: {}
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
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Assignee: assignee.name
    row: 31
    col: 0
    width: 24
    height: 9
  - title: name
    name: name
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [assignee.name, group.name]
    filters: {}
    sorts: [group.name desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: false
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    series_types: {}
    listen:
      Assignee: assignee.name
    row: 0
    col: 0
    width: 8
    height: 4
  - title: Untitled
    name: Untitled
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.dash_title]
    sorts: [ticket.dash_title]
    limit: 500
    custom_color_enabled: true
    custom_color: "#6736de"
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    listen: {}
    row: 0
    col: 8
    width: 16
    height: 4
  - title: Avg Days to Solve (Team)
    name: Avg Days to Solve (Team)
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.avg_days_to_solve]
    filters:
      ticket.created_month: 6 months
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    sparkline_color: ["#5b5d9a"]
    chart_alignment: bottom
    data_granularity: '1'
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color: forestgreen
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    defaults_version: 1
    listen: {}
    row: 10
    col: 4
    width: 4
    height: 3
  - title: Solved Tickets (Team)
    name: Solved Tickets (Team)
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.count_solved_tickets]
    filters:
      ticket.created_month: 6 months
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    sparkline_color: ["#e9b404"]
    chart_alignment: bottom
    data_granularity: '1'
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color: forestgreen
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    defaults_version: 1
    listen: {}
    row: 4
    col: 4
    width: 4
    height: 3
  - title: Avg 1st Response (Team)
    name: Avg 1st Response (Team)
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.avg_hours_to_first_response]
    filters:
      ticket.created_month: 6 months
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    sparkline_color: ["#ed6168"]
    chart_alignment: bottom
    data_granularity: '1'
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color: forestgreen
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    defaults_version: 1
    listen: {}
    row: 7
    col: 4
    width: 4
    height: 3
  - title: Solved Tickets vs Peers
    name: Solved Tickets vs Peers
    model: block_zendesk
    explore: ticket
    type: looker_bar
    fields: [assignee.name, assignee.output_name_select, ticket.count_solved_tickets]
    filters:
      assignee.name: "-NULL"
    sorts: [ticket.count_solved_tickets desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: me, label: Me, expression: 'if(${assignee.output_name_select}
          = ${assignee.name}, ${ticket.count_solved_tickets}, null)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        table_calculation: everyone_else, label: Everyone Else, expression: 'if(${assignee.output_name_select}
          != ${assignee.name}, ${ticket.count_solved_tickets}, null)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: d3bbf1c2-a6ec-4210-b1e7-3e48461cc45b
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{id: highlight_count, name: Highlight
              Count, axisId: highlight_count}, {id: everyone_else_count, name: Everyone
              Else Count, axisId: everyone_else_count}], showLabels: false, showValues: false,
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
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      everyone_else: "#e8e7f5"
      me: "#9E7FD0"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    hidden_fields: [assignee.output_name_select, ticket.count_solved_tickets]
    listen:
      Assignee: assignee.name_select
    row: 4
    col: 8
    width: 16
    height: 6
  - title: Days to Resolution
    name: Days to Resolution
    model: block_zendesk
    explore: ticket
    type: looker_bar
    fields: [assignee.name, assignee.output_name_select, ticket.avg_days_to_solve]
    filters:
      assignee.name: "-NULL"
    sorts: [ticket.avg_days_to_solve desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: me, label: Me, expression: 'if(${assignee.output_name_select}
          = ${assignee.name}, ${ticket.avg_days_to_solve}, null)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: everyone_else, label: Everyone Else, expression: 'if(${assignee.output_name_select}
          != ${assignee.name}, ${ticket.avg_days_to_solve}, null)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{id: highlight_count, name: Highlight
              Count, axisId: highlight_count}, {id: everyone_else_count, name: Everyone
              Else Count, axisId: everyone_else_count}], showLabels: false, showValues: false,
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
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      me: "#9E7FD0"
      everyone_else: "#e8e7f5"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    hidden_fields: [assignee.output_name_select, ticket_close_dates.average_time_to_resolution,
      ticket.avg_days_to_solve]
    listen:
      Assignee: assignee.name_select
    row: 10
    col: 8
    width: 16
    height: 6
  - title: Hours to 1st Response
    name: Hours to 1st Response
    model: block_zendesk
    explore: ticket
    type: looker_bar
    fields: [assignee.name, assignee.output_name_select, ticket.avg_hours_to_first_response]
    filters:
      assignee.name: "-NULL"
    sorts: [ticket.avg_hours_to_first_response desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: me, label: Me, expression: 'if(${assignee.output_name_select}
          = ${assignee.name}, ${ticket.avg_hours_to_first_response}, null)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: everyone_else, label: Everyone Else, expression: 'if(${assignee.output_name_select}
          != ${assignee.name}, ${ticket.avg_hours_to_first_response}, null)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{id: highlight_count, name: Highlight
              Count, axisId: highlight_count}, {id: everyone_else_count, name: Everyone
              Else Count, axisId: everyone_else_count}], showLabels: false, showValues: false,
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
    hide_legend: true
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      me: "#9E7FD0"
      everyone_else: "#e8e7f5"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#000000"
    hidden_fields: [assignee.output_name_select, ticket_close_dates.average_time_to_resolution,
      ticket.avg_hours_to_first_response]
    listen:
      Assignee: assignee.name_select
    row: 16
    col: 8
    width: 16
    height: 7
  - title: Open Ticket Timeline
    name: Open Ticket Timeline
    model: block_zendesk
    explore: ticket
    type: looker_timeline
    fields: [organization.name, ticket.created_date, ticket_close_dates.timeline_close_date,
      ticket.prio_rank]
    filters:
      ticket.is_open: 'Yes'
    sorts: [ticket.prio_rank desc 0, ticket.created_date]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
        reverse: true
    groupBars: true
    labelSize: 10pt
    valueFormat: yy-mmm
    showLegend: true
    series_types: {}
    hidden_fields: []
    listen:
      Assignee: assignee.name
    row: 13
    col: 0
    width: 8
    height: 18
  - title: Weekly Ticket Burndown
    name: Weekly Ticket Burndown
    model: block_zendesk
    explore: ticket
    type: looker_column
    fields: [ticket.created_week, ticket.count_solved_tickets, ticket.count_open_tickets,
      ticket.count_pending_tickets, ticket.count_tickets_on_hold]
    fill_fields: [ticket.created_week]
    filters:
      ticket.created_week: 18 weeks
    sorts: [ticket.created_week desc]
    limit: 500
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: ticket.count, name: Count
              Tickets, axisId: ticket.count}], showLabels: false, showValues: true,
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
    point_style: circle_outline
    series_colors:
      ticket.count_solved_tickets: "#10C871"
      ticket.count_tickets_on_hold: "#7CC8FA"
      ticket.count_open_tickets: "#f56776"
      ticket.count_pending_tickets: "#FCCF41"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen:
      Assignee: assignee.name
    row: 23
    col: 8
    width: 16
    height: 8
  - title: Solved Tickets (Rep)
    name: Solved Tickets (Rep)
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.count_solved_tickets]
    filters:
      ticket.created_month: 6 months
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    sparkline_color: ["#e9b404"]
    chart_alignment: bottom
    data_granularity: '1'
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color: forestgreen
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    defaults_version: 1
    listen:
      Assignee: assignee.name
    row: 4
    col: 0
    width: 4
    height: 3
  - title: Avg 1st Response Hrs (Rep)
    name: Avg 1st Response Hrs (Rep)
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.avg_hours_to_first_response]
    filters:
      ticket.created_month: 6 months
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    sparkline_color: ["#ed6168"]
    chart_alignment: bottom
    data_granularity: '1'
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color: forestgreen
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    defaults_version: 1
    listen:
      Assignee: assignee.name
    row: 7
    col: 0
    width: 4
    height: 3
  - title: Avg Days to Solve (Rep)
    name: Avg Days to Solve (Rep)
    model: block_zendesk
    explore: ticket
    type: single_value
    fields: [ticket.avg_days_to_solve]
    filters:
      ticket.created_month: 6 months
      ticket.name_select: ''
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    sparkline_color: ["#5b5d9a"]
    chart_alignment: bottom
    data_granularity: '1'
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors: [red, blue]
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    custom_color: forestgreen
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    series_types: {}
    colors: ['palette: Mixed Dark']
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: bottom,
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: ticket.avg_days_to_solve,
            name: Avg Days to Solve, axisId: ticket.avg_days_to_solve}]}]
    defaults_version: 1
    listen:
      Assignee: assignee.name
    row: 10
    col: 0
    width: 4
    height: 3
  filters:
  - name: Assignee
    title: Assignee
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
    field: assignee.name
