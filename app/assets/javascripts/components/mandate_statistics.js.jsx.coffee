class @MandateStatistics extends React.Component
  chart_options =
    tooltips:
      displayColors: false
#    tooltipEvents: [],
#    showTooltips: true,
#    onAnimationComplete: ->
#      this.showTooltip(this.segments, true)
#    tooltipTemplate: "<%= label %> - <%= value %>"

  chart_promises_status_colors =
    done: '#5dac5d'
    in_progress: '#d2c500'
    not_yet_started: '#ea7000'
    broken: '#dc4040'

  render: ->
    # Mandate duration
    date_start = new Date(@props.ruling_entity.mandate_start)
    date_end = new Date(@props.ruling_entity.mandate_end)
    total_mandate_duration = Math.ceil(((date_end - date_start) ? 1) / 86400000)
    time_in_office = Math.min(Date.now(), date_end.getTime()) - date_start.getTime()
    days_in_office = Math.floor(time_in_office / 86400000) # Convert milliseconds to days
    mandate_progress = Math.floor(days_in_office / total_mandate_duration * 100)
    # Use a different description for past / present mandated
    if Date.now() > date_end.getTime()
      mandate_duration_description = I18n.t('mandate_terminated')
    else
      mandate_duration_description = I18n.t('days_in_office', {nb_days: days_in_office})

    # Promises statistics
    promises_status_count = _.countBy(@props.promises, (promise) -> promise.status)
    promises_status_keys = _.keys(chart_promises_status_colors)
    chart_data =
      labels: (String(I18n.t("promise.status.#{key}")) for key in promises_status_keys)
      datasets: [
        data: (promises_status_count[key] for key in promises_status_keys),
        backgroundColor: _.values(chart_promises_status_colors)
      ]

    # Main block
    chart_id = "promises-status-count-chart-#{@props.ruling_entity.id}"
    `<div id='mandate-statistics'>
        { mandate_duration_description }
        <ProgressBar progress={mandate_progress}/>
        { /* <ul>{ react_promises_status }</ul> */ }
        <ReactChart className='promises-status-count-chart' data-type='doughnut' id={chart_id} data-options={chart_options} data-chart-data={chart_data}/>
    </div>`
