class @Tab extends React.Component
  constructor: (props) ->
    super(props)
    this.state = {is_active: false}

  @propTypes =
    title: React.PropTypes.node
    content: React.PropTypes.node

  render: ->
    ` <li className="tab-header-and-content">
          <a className={"tab-link " + (this.state.is_active ? 'is-active' : '')}
              onClick={this.on_click}
          >
            { this.props.title }
          </a>
          <div className={"tab-content " + (this.state.is_active ? 'is-open' : '')}>
              { this.props.content }
          </div>
      </li>`

  componentDidMount: () ->
    if @props.initial_active_state
      @props.select_tab(this)

  on_click: (e) =>
    @props.select_tab(this)

  set_active: (is_active) ->
    this.setState({is_active: is_active})
