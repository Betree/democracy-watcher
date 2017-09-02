import React from 'react'
import { connect } from 'react-redux'
import { Route } from 'react-router'

import { getCurrentEntity } from '../../state/ruling_entities/selectors'
import Home from '../App/Home'
import Presentation from './Presentation'
import RulingEntityHeader from './RulingEntityHeader'
import PromisesCategoriesTabs from '../Promises/PromisesCategoriesTabs'

const RulingEntity = ({entity}) => (
  !entity ? null :
  <div>
    <RulingEntityHeader ruling_entity={entity}/>
    <div className="ruling-entity-data-container">
      <div className="ruling-entity-data">
        <Route path="/entities/:entity_id" exact={true} component={Presentation}/>
        <Route path="/entities/:entity_id/promises" component={PromisesCategoriesTabs}/>
        <Route path="/entities/:entity_id/statistics" component={Home}/>
      </div>
    </div>
  </div>
)

export default connect(state => ({entity: getCurrentEntity(state)}))(RulingEntity)