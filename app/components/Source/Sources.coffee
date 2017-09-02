import React from 'react'
import I18n from 'i18n-js'

import {Source} from './Source'

export class Sources extends React.Component
  render: ->
    # Build sources list
    sources = []
    # TODO Generate a unique id
    for source in @props.sources
      sources.push(`<li key={source.url}><Source source={source}/></li>`)

    `<div className="sources">
      { sources.length ? <ul>Sources :{ sources }</ul> : sources = I18n.t('no_source') }
    </div>`
