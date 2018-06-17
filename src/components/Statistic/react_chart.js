import React from 'react'
import Chart from 'chart.js'

class ReactChart extends React.PureComponent {
  render() {
    return <canvas id={this.props.id} className={this.props.className + ' chartjs'}/>
  }

  componentDidUpdate() {
    return this.chart = new Chart(this.props.id, {
      type: this.props['data-type'],
      options: this.props['data-options'],
      data: this.props['data-chart-data']
    });
  }

  componentDidMount() {
    return this.chart = new Chart(this.props.id, {
      type: this.props['data-type'],
      options: this.props['data-options'],
      data: this.props['data-chart-data']
    });
  }
}

export default ReactChart