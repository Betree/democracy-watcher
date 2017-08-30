import React from 'react'
import { connect } from 'react-redux'
import { Link } from 'react-router-dom'

import { getRulingEntities } from '../../state/ruling_entities/selectors'
import RulingEntityHeader from './RulingEntityHeader'

@connect(state => ({entities: getRulingEntities(state)}))
export default class RulingEntitiesList extends React.PureComponent {
  render() {
    return (
      <div className="ruling-entities-list">
        {this.props.entities.map(entity => (
          <Link key={entity.id} to={`/entities/${entity.id}`}>
            <RulingEntityHeader ruling_entity={entity}/>
          </Link>
        ))}
      </div>
    )
  }
}