class @ResponsiveNavigationMenu extends React.PureComponent
  @propTypes =
    title: React.PropTypes.string

  render: ->
    ` <div>
        <Collapsable className='collapsable-menu' trigger={ <span className="navigation-menu-button">MENU</span> }>
            <nav role='navigation'>
                <ul className="navigation-menu">
                    { this.props.selected_entity && this.get_ruling_entities_nav_links(this.props.selected_entity, this.props.all_entities) }
                    { this.get_nav_link(Routes.faq_path(), I18n.t('about')) }
                </ul>
            </nav>
        </Collapsable>
      </div>`

  get_nav_link: (url, title) ->
    `<li className="nav-link">
        <a href={url}>{title}</a>
    </li>`

  get_ruling_entities_nav_links: (selected_entity, all_entities) ->
    #TODO All entities link
    other_entities = []
    if all_entities && all_entities.length > 1
      other_entities = _(all_entities).filter((entity) -> entity.id != selected_entity.id)
    `<li className={'nav-link ruling-entity-selected ' + (other_entities.length > 0 ? 'has-children' : '')}>
        <div className='ruling-entity-selected-title'>{selected_entity.short_name}</div>
        <ul>
          {other_entities.map((entity) =>
              this.get_ruling_entity_nav_link(entity)
          )}
          <li key='see_all' className='ruling-entity-see-all'>
            <a href={Routes.ruling_entities_path()} className='nav-see-all'>{I18n.t('see_all')}</a>
          </li>
        </ul>
      </li>`

  get_ruling_entity_nav_link: (entity) ->
    period = "#{entity.mandate_start.split('-')[0]} - #{entity.mandate_end.split('-')[0]}"
    `<li key={entity.id}>
        <a href={Routes.ruling_entity_path(entity.id)}>
          <span className='date-interval'>{period}</span>
          {entity.short_name}
          <img src={entity.banner.mini.url}/>
        </a>
    </li>`