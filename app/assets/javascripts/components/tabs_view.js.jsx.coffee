class @TabsView extends React.Component
  constructor: (props) ->
    super(props)
    @current_active_tab = null

  @propTypes =
    tabs: React.PropTypes.array

  render: ->
    classes = "accordion-tabs-minimal #{@props.className}"
    `<ul className={classes}>{ this.props.tabs.map((tab) =>
        <ReactTab key={tab.key} title={tab.title} content={tab.content}
                  initial_active_state={tab === this.props.tabs[0]}
                  select_tab={this.select_tab}
        />
      )}</ul>`

  select_tab: (tab) =>
    tab.set_active(true)
    if @current_active_tab
      @current_active_tab.set_active(false)
    @current_active_tab = tab

  @create_tab: (key, title, content) ->
    new Tab(key, title, content)

###
Dummy object to hold value of a tab before creating a React object with it
###
class Tab
  constructor: (@key, @title, @content) ->


###
Don't create Tab directly, use TabsView.create_tab
###
class ReactTab extends React.Component
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