class @RulingEntitiesList extends React.Component
  @propTypes =
    ruling_entities: React.PropTypes.array

  render: ->
    React.DOM.div {className: 'ruling-entities-list'},
      for entity in this.props.ruling_entities
        link = unless entity.is_current then Routes.ruling_party_path(entity.id) else Routes.root_path
        ` <a key={entity.id} href={link}>
              <RulingEntityDescription ruling_entity={entity}/>
          </a>`
