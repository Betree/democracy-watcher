import React from 'react'
import I18n from 'i18n-js'

import Promise from './Promise'

export default class PromisesList extends React.PureComponent {
  render() {
    const allPromises = this.props.promises
    const hasSubjects = allPromises.size > 1 || (allPromises.size === 1 && !allPromises.has(null))
    return (
      <div className="accordion">
        {allPromises.entrySeq().map(([subject, promises]) =>
          <div key={String(subject)}>
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