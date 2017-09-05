import React from 'react'
import I18n from 'i18n-js'

import {Source} from './Source'

export class Sources extends React.PureComponent
  render: ->
    `<div className="sources">
      {this.props.sources.size === 0 ? I18n.t('no_source') :
        <ul>Sources:
          { this.props.sources.map(s =>
            <li key={s.id}><Source source={s}/></li>
          )}
        </ul>
      }
    </div>`
