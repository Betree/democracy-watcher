class @ResponsiveNavigationMenu extends React.PureComponent
  PROMISES_MODULE = 'promises'
  STATISTICS_MODULE = 'statistics'

  @propTypes =
    title: React.PropTypes.string

  constructor: (props) ->
    super(props)
    @state = {all_entities: []}
    console.log 'constructor'

  componentDidMount: ->
    console.log 'mount'


  render: ->
    active_module = @get_active_module(this.props.selected_entity)
    collapse_trigger = `<span className="navigation-menu-button">MENU</span>`
    links_entity = @ruling_entities_links @props.selected_entity, @state.all_entities, active_module
    modules_links = this.modules_links(this.props.selected_entity, active_module)

    ` <div>
        <Collapsable className='collapsable-menu' trigger={ collapse_trigger }>
            <nav role='navigation'>
                <ul className="navigation-menu">
                    { links_entity }
                    { modules_links }
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

  ruling_entities_links: (selected_entity, all_entities, active_module) ->
    # Filter others entities list to remove currently selected entity
    other_entities = all_entities
    if selected_entity and all_entities and all_entities.length > 1
      other_entities = _(other_entities).filter((entity) -> entity.id != selected_entity.id)

    # Base link will show currently selected entity if any, otherwise just a label
    entity_title = if selected_entity then selected_entity.short_name else I18n.t('select_entity')
    selected_entity_link = `<a className='ruling-entity-selected-title'>{entity_title}</a>`
    has_children = if other_entities.length > 0 then 'has-children' else ''

    `<li className={'nav-link ruling-entity-selected ' + has_children}>
        { selected_entity_link }
        <ul>
          {other_entities.map((entity) =>
              this.ruling_entity_nav_link(entity, active_module)
          )}
          <li key='see_all' className='ruling-entity-see-all'>
            <a href={Routes.ruling_entities_path()} className='nav-see-all'>
              {I18n.t('see_all')}
            </a>
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
      @nav_link(Routes.ruling_entity_promises_path(entity.id), I18n.t('models.promise.other'),
        active_module == PROMISES_MODULE)
      @nav_link(Routes.ruling_entity_statistics_path(entity.id), I18n.t('models.statistic.other'),
        active_module == STATISTICS_MODULE)
    ]

  nav_link: (url, title, is_active=false) ->
    ` <li className="nav-link" key={url}>
          <a href={url} className={is_active ? 'active' : ''}>{title}</a>
      </li>`

