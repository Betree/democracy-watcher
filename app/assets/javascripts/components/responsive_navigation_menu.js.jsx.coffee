class @ResponsiveNavigationMenu extends React.PureComponent
  FOCUS =
    leader: 1,
    ruling_entity: 2

  MODULES =
    promises: 1,
    statistics: 2,
    statements: 3,
    entity_presentation: 4

  @propTypes =
    title: React.PropTypes.string

  render: ->
    active_focus = @get_active_focus()
    active_module = @get_active_module(@props.selected_entity, @props.selected_leader)

    # Select focus : can be focused on Politicians or on RulingEntities
    type_focus_links = [
      @nav_link(Routes.leaders_path(), I18n.t('models.leader.other'),
        active_focus == FOCUS.leader)
      @nav_link(Routes.ruling_entities_path(), I18n.t('models.ruling_entity.other'),
        active_focus == FOCUS.ruling_entity)
    ]

    # Select currently focused element (one politician or one ruling entity) and show others in list
    if active_module and active_focus is FOCUS.ruling_entity
      current_focus_links = @focus_links @props.selected_entity, @props.all_entities,
                                          active_module, Routes.ruling_entities_path(),
                                          @ruling_entity_nav_link
    else if active_module and active_focus is FOCUS.leader
      current_focus_links = @focus_links @props.selected_leader, @props.all_leaders,
                                          active_module, Routes.leaders_path(), @leader_nav_link

    # Links to modules for current focus
    modules_links = this.modules_links(this.props.selected_entity, active_module)

    collapse_trigger = `<span className="navigation-menu-button">MENU</span>`
    ` <div>
        <Collapsable className='collapsable-menu' trigger={ collapse_trigger }>
            <nav role='navigation'>
                <ul className="navigation-menu">
                    <div className='button-group'>{ type_focus_links }</div>
                    { current_focus_links }
                    { modules_links }
                </ul>
            </nav>
        </Collapsable>
      </div>`

  get_active_focus: ->
    if window.location.pathname is Routes.root_path()
      return null
    focus = window.location.pathname.split('/')[1]

    if focus is Routes.leaders_path().split('/')[1]
      return FOCUS.leader
    else if focus is Routes.ruling_entities_path().split('/')[1]
      return FOCUS.ruling_entity
    return null

  get_active_module: (selected_entity, selected_leader) ->
    unless selected_entity
      return null

    if selected_entity
      switch window.location.pathname
        when Routes.ruling_entity_promises_path(selected_entity) then return MODULES.promises
        when Routes.ruling_entity_statistics_path(selected_entity) then return MODULES.statistics
        when Routes.ruling_entity_path(selected_entity) then return MODULES.entity_presentation

    else if selected_leader
      switch window.location.pathname
        when Routes.leader_statements_path(selected_leader) then return MODULES.statements

    null

  focus_links: (selected_entity, all_focus, active_module, see_all_path, nav_link_func) ->
    # Filter others entities list to remove currently selected entity
    other_focus = all_focus
    if selected_entity and all_focus and all_focus.length > 1
      other_focus = _(other_focus).filter((entity) -> entity.id != selected_entity.id)

    # Base link will show currently selected entity if any, otherwise just a label
    entity_title = if selected_entity then selected_entity.short_name else I18n.t('select_entity')
    selected_focus_link = `<a className='focus-selected-title'>{entity_title}</a>`
    has_children = if other_focus.length > 0 then 'has-children' else ''

    `<li className={'nav-link focus-selected ' + has_children}>
        { selected_focus_link }
        <ul>
          {other_focus.map((focus) =>
              nav_link_func(focus, active_module)
          )}
          <li key='see_all' className='focus-see-all'>
            <a href={see_all_path} className='nav-see-all'>
              {I18n.t('see_all')}
            </a>
          </li>
        </ul>
      </li>`

  ruling_entity_nav_link: (entity, active_module) ->
    period = "#{entity.mandate_start.split('-')[0]} - #{entity.mandate_end.split('-')[0]}"
    link_generator = switch active_module
      when MODULES.promises then Routes.ruling_entity_promises_path
      else Routes.ruling_entity_path

    `<li key={entity.id}>
        <a href={link_generator(entity.id)}>
          <span className='date-interval'>{period}</span>
          {entity.short_name}
          <img src={entity.banner.mini.url}/>
        </a>
    </li>`

  leader_nav_link: (leader, active_module) ->


  modules_links: (entity, active_module) ->
    unless entity
      return []

    [
      @nav_link(Routes.ruling_entity_path(entity.id), I18n.t('presentation'), active_module == null)
      @nav_link(Routes.ruling_entity_promises_path(entity.id), I18n.t('models.promise.other'),
        active_module == MODULES.promises)
      @nav_link(Routes.ruling_entity_statistics_path(entity.id), I18n.t('models.statistic.other'),
        active_module == MODULES.statistics)
    ]

  nav_link: (url, title, is_active=false) ->
    ` <li className="nav-link" key={url}>
          <a href={url} className={is_active ? 'active' : ''}>{title}</a>
      </li>`

