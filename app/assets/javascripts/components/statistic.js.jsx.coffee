class @Statistic extends React.Component
  @propTypes =
    description: React.PropTypes.node
    graph_type: React.PropTypes.string
    json_options: React.PropTypes.node
    json_data: React.PropTypes.node

  render: ->
    console.log @props.json_data
    ` <div>
        <div className='statistic-description'>{this.props.description}</div>
        {this.props.graph_type &&
            <LineChart data={ this.props.json_data ? JSON.parse(this.props.json_data) : {} }/>
        }
      </div>`
