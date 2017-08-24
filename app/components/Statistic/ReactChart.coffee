class @ReactChart extends React.Component
  render: ->
    `<canvas id={this.props.id} className={this.props.className + ' chartjs'}/>`

  componentDidMount: ->
    @chart = new Chart @props.id, {
      type: @props['data-type'],
      options: @props['data-options'],
      data: @props['data-chart-data']
    }

