class @Collapsable extends React.Component
  constructor: (props) ->
    super(props)
    @state = {is_expanded: false}

  render: ->
    ` <div className={this.props.className}>
        <div onClick={this.click_toggle_expanded}>{ this.props.trigger }</div>
        <div className={"collapsable " + (this.state.is_expanded ? 'is-expanded' : '')}>
          { this.props.children }
        </div>
      </div>`

  click_toggle_expanded: (e) =>
    e.preventDefault()
    this.setState (prev_state) ->
      {is_expanded: !prev_state.is_expanded}