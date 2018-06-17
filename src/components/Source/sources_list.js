import React from 'react'
import I18n from 'i18n-js'

import Source from './source'

export default class SourcesList extends React.PureComponent {
  render() {
    return <div className="sources">
      {this.props.sources.length === 0 ? I18n.t('no_source') :
        <ul>{I18n.t('sources')}:
          { this.props.sources.map(s =>
            <li key={s.url}><Source source={s}/></li>
          )}
        </ul>
      }
    </div>
  }
}
