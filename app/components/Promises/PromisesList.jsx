import React from 'react'
import I18n from 'i18n-js'

import Promise from './Promise'

export default class PromisesList extends React.PureComponent {
  render() {
    const groupedPromises = this.props.promises.groupBy(p => p.subject)
    const hasSubjects = groupedPromises.size > 1 || (groupedPromises.size === 1 && !groupedPromises.has(null))
    return (
      <div className="accordion">
        {groupedPromises.entrySeq().map(([subject, promises]) =>
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