class @RulingEntityData extends React.Component
  render: ->
    `<div id="ruling-entity-data">
      <PromisesCategoriesTabs promises={this.props.promises}/>
      <MandateStatistics ruling_entity={this.props.ruling_entity} promises={this.props.promises}/>
    </div>`
