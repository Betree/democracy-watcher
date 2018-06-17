import React from 'react'
import { Link } from 'gatsby'
import I18n from 'i18n-js'

import RulingEntityLayout from '../components/Layout/ruling_entity'
import { promisesUrl } from '../lib/url_utils'


const RulingEntityPresentation = ({pageContext: {entity}}) => {
  return (
    <RulingEntityLayout entity={entity}>
      <div className="ruling-entity-description-container">
        {entity.description}
        <div className="quick-actions-buttons">
          <Link to={promisesUrl(entity)}>
            <button>{I18n.t('see_promises')}</button>
          </Link>
        </div>
      </div>
    </RulingEntityLayout>
  )
}

export default RulingEntityPresentation