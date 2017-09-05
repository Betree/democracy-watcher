import React from 'react'
import classNames from 'classnames'
import I18n from 'i18n-js'

import Collapsable from '../Utils/Collapsable'
import {Sources} from '../Source/Sources'


const Promise = ({promise}) => {
  const hasChildren = promise.description || promise.sources.size > 0
  return (
    <Collapsable
      trigger={
        <div className={classNames('promise-header', {'has-children': hasChildren})}>
          <div className='status'>
            <i className={'fa status-' + promise.status}
               title={I18n.t('models.promise.status.' + promise.status)}/>
          </div>
          <div className="title">{promise.title}</div>
        </div>
      }
      children={!hasChildren ? null :
        <div className="more-infos">
          <div className={classNames('description', {'has-sources': promise.sources.size > 0})}>
            { promise.description }
          </div>
          { promise.sources.size > 0 && <Sources sources={promise.sources}/>}
        </div>
      }
    />
  )
}

export default Promise

