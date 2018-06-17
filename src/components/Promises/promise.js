import React from 'react'
import classNames from 'classnames'
import I18n from 'i18n-js'

import Collapsable from '../Utils/collapsable'
import SourcesList from '../Source/sources_list'


const Promise = ({promise}) => {
  const hasChildren = promise.description || promise.sources.length > 0
  return (
    <Collapsable
      trigger={
        <div className={classNames('promise-header', {'has-children': hasChildren})}>
          <div className='status'>
            <i className={'fa status-' + promise.status}
               title={I18n.t('promise.status.' + promise.status)}/>
          </div>
          <div className="title">{promise.title}</div>
        </div>
      }
      children={!hasChildren ? null :
        <div className="more-infos">
          <div className={classNames('description', {'has-sources': promise.sources.length > 0})}>
            { promise.description }
          </div>
          { promise.sources.length > 0 && <SourcesList sources={promise.sources}/>}
        </div>
      }
    />
  )
}

export default Promise

