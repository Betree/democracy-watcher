class @StatisticsColumns extends React.Component
  render: ->
    left_col_stats = @get_react_statistics(_.filter(@props.statistics, (s) -> s.id % 2 != 0))
    right_col_stats = @get_react_statistics(_.filter(@props.statistics, (s) -> s.id % 2 == 0))
    `<div>
        <div className="col">{ left_col_stats }</div>
        <div className="col">{ right_col_stats }</div>
    </div>`

  get_react_statistics: (statistics) ->
    for stat in statistics
      `<Statistic description={stat.description} chart_type={stat.chart_type}
                  sources={stat.sources} yaml_chart_data={stat.chart_data}
                  yaml_chart_options={stat.chart_options} key={stat.id}/>`