class @ShowRulingEntity extends React.Component
  render: ->
    ` <div>
        <RulingEntityDescription ruling_entity={this.props.ruling_entity}/>
        <div id='ruling-entity-data-container'>
          <RulingEntityData ruling_entity={this.props.ruling_entity} promises={this.props.promises}/>
        </div>
      </div>`

