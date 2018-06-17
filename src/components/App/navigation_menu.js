import React from 'react'
import { Link } from 'gatsby'
import I18n from "i18n-js"
import classNames from 'classnames'

import Collapsable from '../Utils/collapsable'
import RulingEntityShortTitle from '../RulingEntities/RulingEntityShortTitle'
import { entityUrl, promisesUrl } from '../../lib/url_utils'


export default class NavigationMenu extends React.PureComponent {
  render() {
    const selected = this.props.selected
    const entities = this.props.entities

    return (
      <div>
        <Collapsable
          className='collapsable-menu'
          trigger={<span className="navigation-menu-button">MENU</span>}
        >
          <nav>
            <ul className="navigation-menu">
              { this.ruling_entities_links(selected, entities) }
              { this.modules_links(selected) }
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
      <li className={classNames('nav-link', 'ruling-entity-selected', {'has-children': all_entities.length > 0})}>
        <div className='ruling-entity-selected-title'>{entity_title}</div>
        <ul>
          {all_entities.map(entity => this.ruling_entity_MenuEntry(entity))}
          <li key='see_all' className='ruling-entity-see-all'>
            <Link to="/entities" className='nav-see-all'>
              {I18n.t('see_all')}
            </Link>
          </li>
        </ul>
      </li>
    )
  }

  ruling_entity_MenuEntry(entity) {
    return (
      <li key={entity.id}>
        <Link to={entityUrl(entity)}>
            <span className='date-interval'>
              {entity.mandate_start.split('-')[0]} - {entity.mandate_end.split('-')[0]}
            </span>
            <RulingEntityShortTitle entity={entity}/>
            <img alt="" src={entity.thumb}/>
        </Link>
      </li>
    )
  }

  modules_links(entity) {
    if (!entity)
      return []

    return (
      <React.Fragment>
        {this.MenuEntry(entityUrl(entity), I18n.t('presentation'), true)}
        {this.MenuEntry(promisesUrl(entity), I18n.t('promise.other'))}
      </React.Fragment>
    )
  }

  MenuEntry(url, title, exact=false) {
    return (
      <li className="nav-link" key={url}>
        <Link exact={exact} activeClassName="active" to={url}>{title}</Link>
      </li>
    )
  }
}
