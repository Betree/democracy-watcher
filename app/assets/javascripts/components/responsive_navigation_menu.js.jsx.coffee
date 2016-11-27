class @ResponsiveNavigationMenu extends React.PureComponent
  PROMISES_MODULE = 'promises'
  STATISTICS_MODULE = 'statistics'

  @propTypes =
    title: React.PropTypes.string

  render: ->
    active_module = @get_active_module(this.props.selected_entity)
    ` <div>
        <Collapsable className='collapsable-menu' trigger={ <span className="navigation-menu-button">MENU</span> }>
            <nav role='navigation'>
                <ul className="navigation-menu">
                    { this.ruling_entities_nav_links(this.props.selected_entity, this.props.all_entities,
                                                          active_module)
                    }
                    { this.modules_links(this.props.selected_entity, active_module) }
                </ul>
            </nav>
        </Collapsable>
      </div>`

  get_active_module: (selected_entity) ->
    unless selected_entity
      return null

    switch window.location.pathname
      when Routes.ruling_entity_promises_path(selected_entity) then PROMISES_MODULE
      when Routes.ruling_entity_statistics_path(selected_entity) then STATISTICS_MODULE
      else null

  ruling_entities_nav_links: (selected_entity, all_entities, active_module) ->
    # Filter others entities list to remove currently selected entity
    other_entities = all_entities
    if selected_entity and all_entities and all_entities.length > 1
      other_entities = _(other_entities).filter((entity) -> entity.id != selected_entity.id)

    # Base link will show currently selected entity if any, otherwise just a label
    if selected_entity
      selected_entity_link = `<a className='ruling-entity-selected-title'>{selected_entity.short_name}</a>`
    else
      selected_entity_link = `<a className='ruling-entity-selected-title'>{I18n.t('select_entity')}</a>`


    `<li className={'nav-link ruling-entity-selected ' + (other_entities.length > 0 ? 'has-children' : '')}>
        { selected_entity_link }
        <ul>
          {other_entities.map((entity) =>
              this.ruling_entity_nav_link(entity, active_module)
          )}
          <li key='see_all' className='ruling-entity-see-all'>
            <a href={Routes.ruling_entities_path()} className='nav-see-all'>{I18n.t('see_all')}</a>
          </li>
        </ul>
      </li>`

  ruling_entity_nav_link: (entity, active_module) ->
    period = "#{entity.mandate_start.split('-')[0]} - #{entity.mandate_end.split('-')[0]}"
    link_generator = switch active_module
      when PROMISES_MODULE then Routes.ruling_entity_promises_path
      else Routes.ruling_entity_path

    `<li key={entity.id}>
        <a href={link_generator(entity.id)}>
          <span className='date-interval'>{period}</span>
          {entity.short_name}
          <img src={entity.banner.mini.url}/>
        </a>
    </li>`

  modules_links: (entity, active_module) ->
    unless entity
      return []

    [
      @nav_link(Routes.ruling_entity_path(entity.id), I18n.t('presentation'), active_module == null)
      @nav_link(Routes.ruling_entity_promises_path(entity.id), I18n.t('promises'), active_module == PROMISES_MODULE)
      @nav_link(Routes.ruling_entity_statistics_path(entity.id), I18n.t('statistics'), active_module == STATISTICS_MODULE)
    ]

  nav_link: (url, title, is_active=false) ->
    ` <li className="nav-link" key={url}>
          <a href={url} className={is_active ? 'active' : ''}>{title}</a>
      </li>`

