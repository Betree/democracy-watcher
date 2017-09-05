import React from 'react'
import Chart from 'chart.js'

class ReactChart extends React.PureComponent
  render: ->
    `<canvas id={this.props.id} className={this.props.className + ' chartjs'}/>`

  componentDidUpdate: ->
    @chart = new Chart @props.id, {
      type: @props['data-type'],
      options: @props['data-options'],
      data: @props['data-chart-data']
    }

  componentDidMount: ->
    @chart = new Chart @props.id, {
      type: @props['data-type'],
      options: @props['data-options'],
      data: @props['data-chart-data']
    }

export default ReactChart