import React from 'react'
import {connect} from 'react-redux'
import {NavLink} from 'react-router-dom'
import I18n from "i18n-js"
import classNames from 'classnames'

import {getCurrentLocation} from '../../state/misc_selectors'
import {getCurrentEntity, getRulingEntities} from '../../state/ruling_entities/selectors'
import Collapsable from '../Utils/Collapsable'
import RulingEntityShortTitle from '../RulingEntities/RulingEntityShortTitle'


@connect(state => ({
  entities: getRulingEntities(state),
  selected: getCurrentEntity(state),
  location: getCurrentLocation(state)
}))
export default class NavigationMenu extends React.PureComponent {
  render() {
    const links_entity = this.ruling_entities_links(this.props.selected, this.props.entities)
    const modules_links = this.modules_links(this.props.selected)

    return (
      <div>
        <Collapsable className='collapsable-menu' trigger={ <span className="navigation-menu-button">MENU</span> }>
          <nav role='navigation'>
            <ul className="navigation-menu">
              { links_entity }
              { modules_links }
            </ul>
          </nav>
        </Collapsable>
      </div>
    )
  }

  ruling_entities_links(selected_entity, all_entities) {
    // Base link will show currently selected entity if any, otherwise just a label
    const entity_title = selected_entity ? selected_entity.name : I18n.t('select_entity')
    return (
      <li className={classNames('nav-link', 'ruling-entity-selected', {'has-children': all_entities.size > 0})}>
        <a className='ruling-entity-selected-title'>{entity_title}</a>
        <ul>
          {all_entities.map(entity => this.ruling_entity_MenuEntry(entity))}
          <li key='see_all' className='ruling-entity-see-all'>
            <NavLink to="/entities" className='nav-see-all'>
              {I18n.t('see_all')}
            </NavLink>
          </li>
        </ul>
      </li>
    )
  }

  ruling_entity_MenuEntry(entity) {
    return (
      <li key={entity.id}>
        <NavLink to={`/entities/${entity.id}`} location={this.props.location}>
            <span className='date-interval'>
              {entity.mandate_start.split('-')[0]} - {entity.mandate_end.split('-')[0]}
            </span>
            <RulingEntityShortTitle entity={entity}/>
            <img src={entity.thumb}/>
        </NavLink>
      </li>
    )
  }

  modules_links(entity) {
    if (!entity)
      return []

    const entries = [this.MenuEntry(`/entities/${entity.id}`, I18n.t('presentation'), true)]
    if (entity.modules.includes('PROMISE'))
      entries.push(this.MenuEntry(`/entities/${entity.id}/promises`, I18n.t('promise.other')))
    return entries
  }

  MenuEntry(url, title, exact=false) {
    return (
      <li className="nav-link" key={url}>
        <NavLink exact={exact} to={url} location={this.props.location}>{title}</NavLink>
      </li>
    )
  }
}
