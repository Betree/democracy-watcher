class @MandateStatistics extends React.Component
  render: ->
    # Mandate duration
    date_start = new Date(@props.ruling_party.mandate_start)
    date_end = new Date(@props.ruling_party.mandate_end)
    time_in_office = Math.min(Date.now(), date_end.getTime()) - date_start.getTime()
    days_in_office = Math.floor(time_in_office / 86400000) # Convert milliseconds to days
    progress_percent = Math.floor(days_in_office / @props.ruling_party.total_mandate_duration * 100)

    # Promises statistics
    promises_status_count = {}
    for promise in @props.promises
      promises_status_count[promise.status] ?= 0
      promises_status_count[promise.status] += 1
    react_promises_status = for status_name, promises_count of promises_status_count
      status_name_local = I18n.t("promise.status.#{status_name}")
      ` <li className="status" key={status_name}>
            <i className={"fa status-" + status_name} title={status_name_local}/>
            <span>{ status_name_local + ': ' }</span>
            <span>{ promises_count }</span>
        </li>`

    # Main block
    `<div id='mandate-statistics'>
        { I18n.t('days_in_office', {nb_days: days_in_office}) }
        <div className="progress-bar-indication">
            <span className="meter" style={{width: progress_percent + '%'}}><p></p></span>
        </div>
        <ul>{ react_promises_status }</ul>
    </div>`
