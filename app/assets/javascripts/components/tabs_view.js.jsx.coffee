class @TabsView extends React.Component
  render: ->
    classes = "accordion-tabs-minimal #{this.props.className}"
    `<ul className={classes}>{this.props.children}</ul>`
