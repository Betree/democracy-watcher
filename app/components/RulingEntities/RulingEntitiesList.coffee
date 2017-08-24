class @RulingEntitiesList extends React.Component
  @propTypes =
    ruling_entities: React.PropTypes.array

  render: ->
    React.DOM.div {className: 'ruling-entities-list'},
      for entity in this.props.ruling_entities
        link = Routes.ruling_entity_path(entity.id)
        ` <a key={entity.id} href={link}>
              <RulingEntityHeader ruling_entity={entity}/>
          </a>`
