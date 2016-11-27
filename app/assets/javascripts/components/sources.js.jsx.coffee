class @Sources extends React.Component
  render: ->
    # Build sources list
    sources = []
    for source in @props.sources
      sources.push(`<li key={source.id}><Source source={source}/></li>`)

    `<div className="sources">
      { sources.length ? <ul>Sources :{ sources }</ul> : sources = I18n.t('no_source') }
    </div>`
