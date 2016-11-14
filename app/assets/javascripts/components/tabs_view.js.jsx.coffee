class @TabsView extends React.Component
  constructor: (props) ->
    super(props)
    @current_active_tab = null

  render: ->
    classes = "accordion-tabs-minimal #{@props.className}"
    `<ul className={classes}>{ this.render_children(this.props.children) }</ul>`

  render_children: (children) ->
    is_first = true
    # Add binding for select tab method and tell first tab it should be activated
    React.Children.map @props.children, (child) =>
      if child.type is Tab
        modified_child = React.cloneElement child,
          initial_active_state: is_first
          select_tab: @select_tab
        is_first = false
        return modified_child
      else
        console.log 'Warning: TabsView only accepts Tab component as children'

  select_tab: (tab) =>
    tab.set_active(true)
    if @current_active_tab
      @current_active_tab.set_active(false)
    @current_active_tab = tab