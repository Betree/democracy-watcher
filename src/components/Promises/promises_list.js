import React from 'react'
import I18n from 'i18n-js'
import groupBy from 'lodash.groupby'

import Promise from './promise'

export default class PromisesList extends React.PureComponent {
  render() {
    const groupedPromises = groupBy(this.props.promises, 'subject')
    const hasSubjects = groupedPromises.length > 1 || (groupedPromises.length === 1 && !groupedPromises.has(null))

    return (
      <div className="accordion">
        {Object.entries(groupedPromises).map(([subject, promises]) =>
          <div key={subject}>
            { /* Only display subject if we have something else than "Others" subject */ }
            { hasSubjects && <h4 className='promises-subject'>{subject || I18n.t('others')}</h4>}
            { promises.map(promise =>
              <div className={"promise " + promise.status} key={promise.id}>
                <Promise promise={promise}/>
              </div>
            )}
          </div>
        )}
      </div>
    )
  }
}