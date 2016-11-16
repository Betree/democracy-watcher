class @ShowRulingEntity extends React.Component
  render: ->
    ` <div>
        <RulingEntityDescription ruling_entity={this.props.ruling_entity}/>
        <RulingEntityData ruling_entity={this.props.ruling_entity} promises={this.props.promises}/>
      </div>`

#    data = `<RulingEntityData key="RulingEntityData" ruling_entity={this.props.ruling_entity} promises={this.props.promises}/>`
#
#    ` <div>
#        <RulingEntityDescription ruling_entity={this.props.ruling_entity}/>
#        <React.addons.CSSTransitionGroup transitionName="example"
#                                 transitionEnterTimeout={500}
#                                 transitionLeaveTimeout={300}
#                                 transitionAppear={true}
#                                 transitionAppearTimeout={500}
#        >
#            { data }
#        </React.addons.CSSTransitionGroup>
#    </div>`
