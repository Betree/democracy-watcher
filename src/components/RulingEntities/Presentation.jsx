import React from 'react'
import {Link} from 'react-router-dom'
import {connect} from 'react-redux'
import I18n from 'i18n-js'

import {getCurrentEntity} from '../../state/ruling_entities/selectors'


const RulingEntity = ({entity}) => {
  const promiseModule = entity.modules.includes('PROMISE')
  const statisticModule = entity.modules.includes('STATISTIC')
  return (
    <div className="ruling-entity-description-container">
      {entity.description}
      {(promiseModule || statisticModule) &&
        <div className="quick-actions-buttons">
          {promiseModule &&
          <Link to={`/entities/${entity.id}/promises`}>
            <button>{I18n.t('see_promises')}</button>
          </Link>
          }
        </div>
      }
    </div>
  )
}

export default connect(state => ({entity: getCurrentEntity(state)}))(RulingEntity)