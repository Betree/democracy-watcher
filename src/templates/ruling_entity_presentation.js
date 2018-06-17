import React from 'react'
import { Link } from 'gatsby'
import I18n from 'i18n-js'
import RulingEntityLayout from '../components/Layout/ruling_entity'


const RulingEntityPresentation = ({pathContext: {entity}}) => {
  return (
    <RulingEntityLayout entity={entity}>
      <div className="ruling-entity-description-container">
        {entity.description}
        <div className="quick-actions-buttons">
          <Link to={`/entities/${entity.id}/promises`}>
            <button>{I18n.t('see_promises')}</button>
          </Link>
        </div>
      </div>
    </RulingEntityLayout>
  )
}

export default RulingEntityPresentation