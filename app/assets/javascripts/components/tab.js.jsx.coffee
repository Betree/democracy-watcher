class @Tab extends React.Component
  constructor: (props) ->
    super(props)
    this.state = {is_active: false}

  @propTypes =
    title: React.PropTypes.node
    content: React.PropTypes.node

  render: ->
    ` <li className="tab-header-and-content">
          <a className={"tab-link " + (this.state.is_active ? 'is-active' : '')}>
            { this.props.title }
          </a>
          <div className="tab-content">{ this.props.content }</div>
      </li>`

#TODO  click_on_tab: (e) =>
#    e.preventDefault()
#    this.setState (prev_state) ->
#      {is_expended: !prev_state.is_expended}