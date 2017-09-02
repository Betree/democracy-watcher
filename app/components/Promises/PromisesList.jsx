import React from 'react'

import Promise from './Promise'

export default class PromisesList extends React.PureComponent {
  render() {
    // Separate promises in subjects
    // others_key = I18n.t('others')
    // subjected_promises = _.groupBy @props.promises, (promise) ->
    //   promise.subject.title ? others_key
    // TODO group by subject

    // content = for subject, promises of subjected_promises
    //   has_only_others_subjects = @has_only_others_subjects(subjected_promises, others_key)
    //   `<div key={subject}>
    //       { /* Only display subject if we have something else than "Others" subject */ }
    //       { !has_only_others_subjects &&
    //           <h4 className='promises-subject'>{subject}</h4>
    //       }
    //       { promises.map((promise) =>
    //         <div className={"promise " + promise.status} key={promise.id}>
    //           <Promise promise={promise}/>
    //         </div>
    //       )}
    //   </div>`
    return (
      <div className="accordion">
        { this.props.promises.map(promise =>
          // TODO Key is not really unique. Generate a unique one when creating record
         <div className={"promise " + promise.status} key={promise.title}>
           <Promise promise={promise}/>
         </div>
        )}
      </div>
    )
  }

  // has_only_others_subjects: (subjected_promises, others_key) ->
  //   _.size(subjected_promises) == 1 && others_key of subjected_promises
}