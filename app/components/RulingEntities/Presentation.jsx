import React from 'react'
import {Link} from 'react-router-dom'
import {connect} from 'react-redux'
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
            <button>See Promises</button>
          </Link>
          }
          {statisticModule &&
          <Link to={`/entities/${entity.id}/statistics`}>
            <button>See Statistics</button>
          </Link>
          }
        </div>
      }
    </div>
  )
}

export default connect(state => ({entity: getCurrentEntity(state)}))(RulingEntity)