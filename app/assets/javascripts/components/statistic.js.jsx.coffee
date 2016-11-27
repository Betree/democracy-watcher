class @Statistic extends React.Component
  @propTypes =
    description: React.PropTypes.node
    sources: React.PropTypes.array
    chart_type: React.PropTypes.string
    yaml_chart_options: React.PropTypes.node
    yaml_chart_data: React.PropTypes.node

  chart_components =
    line: LineChart
    pie: PieChart
    column: ColumnChart
    bar: BarChart
    area: AreaChart
    scatter: ScatterChart

  render: ->
    ChartComponent = chart_components[@props.chart_type]
    chart_options = if @props.yaml_chart_options then jsyaml.safeLoad(@props.yaml_chart_options) else {}
    chart_data = if @props.yaml_chart_data then jsyaml.safeLoad(@props.yaml_chart_data) else {}
    ` <div>
        {this.props.description &&
          <div className='statistic-description' dangerouslySetInnerHTML={{__html: this.props.description}}/>
        }
        {this.props.description && ChartComponent != undefined &&
          <hr/>
        }
        {ChartComponent != undefined &&
          <ChartComponent { ...chart_options } data={ chart_data }/>
        }
        <Sources sources={this.props.sources}/>
    </div>
    `

