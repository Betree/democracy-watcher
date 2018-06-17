import React from 'react'
import I18n from 'i18n-js'
import groupBy from 'lodash.groupby'

import Promise from './promise'

export default class PromisesList extends React.PureComponent {
  render() {
    const groupedPromises = groupBy(this.props.promises, 'subject')
    const nbSubjects = Object.keys(groupedPromises).length
    const hasSubjects = nbSubjects > 1 || (nbSubjects === 1 && groupedPromises[null])

    return (
      <div className="accordion">
        {Object.entries(groupedPromises).map(([subject, promises]) =>
          <div key={subject}>
            { /* Only display subject if we have something else than "Others" subject */ }
            { hasSubjects && this.renderSubject(subject)}
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

  renderSubject(subject) {
    const label = subject === 'null' ? I18n.t('others') : subject
    return <h4 className='promises-subject'>{label}</h4>
  }
}