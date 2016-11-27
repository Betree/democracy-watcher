class @Statistic extends React.Component
  @propTypes =
    description: React.PropTypes.node
    chart_type: React.PropTypes.string
    json_options: React.PropTypes.node
    json_data: React.PropTypes.node

  chart_components =
    line: LineChart
    pie: PieChart
    column: ColumnChart
    bar: BarChart
    area: AreaChart
    scatter: ScatterChart

  render: ->
    ChartComponent = chart_components[this.props.chart_type]
    ` <div>
        {this.props.description &&
          <div className='statistic-description'>{this.props.description}</div>
        }
        {ChartComponent != undefined &&
          <ChartComponent data={ this.props.json_data ? JSON.parse(this.props.json_data) : {} }/>
        }
      </div>
    `

