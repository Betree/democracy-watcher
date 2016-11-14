class @RulingEntitiesList extends React.Component
  @propTypes =
    ruling_entities: React.PropTypes.array

  render: ->
    React.DOM.div null,
      for entity in this.props.ruling_entities
        `<RulingEntityDescription key={entity.id} ruling_entity={entity}/>`
