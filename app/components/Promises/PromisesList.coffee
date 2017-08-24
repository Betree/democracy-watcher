class @PromisesList extends React.Component
  render: ->
    # Separate promises in subjects
    others_key = I18n.t('others')
    subjected_promises = _.groupBy @props.promises, (promise) ->
      promise.subject.title ? others_key

    content = for subject, promises of subjected_promises
      has_only_others_subjects = @has_only_others_subjects(subjected_promises, others_key)
      `<div key={subject}>
          { /* Only display subject if we have something else than "Others" subject */ }
          { !has_only_others_subjects &&
              <h4 className='promises-subject'>{subject}</h4>
          }
          { promises.map((promise) =>
            <div className={"promise " + promise.status} key={promise.id}>
              <Promise promise={promise}/>
            </div>
          )}
      </div>`

    `<div className="accordion">
        { content }
    </div>`

  has_only_others_subjects: (subjected_promises, others_key) ->
    _.size(subjected_promises) == 1 && others_key of subjected_promises
