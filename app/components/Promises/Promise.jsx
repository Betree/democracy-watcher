import React from 'react'
import classNames from 'classnames'
import I18n from 'i18n-js'

import Collapsable from '../Utils/Collapsable'
import {Sources} from '../Source/Sources'


const Promise = ({promise}) => (
  <Collapsable
    trigger={
      <div className="promise-header">
        <div className='status'>
          <i className={'fa status-' + promise.status.toLowerCase()}
             title={I18n.t('models.promise.status.' + promise.status.toLowerCase())}/>
        </div>
        <div className="title">{promise.title}</div>
      </div>
    }
    children={
      <div className="more-infos">
        <div className={classNames('description', {'has-sources': !!promise.sources})}>
          { promise.description }
        </div>
        { promise.sources && <Sources sources={promise.sources}/>}
      </div>
    }
  />
)

export default Promise

