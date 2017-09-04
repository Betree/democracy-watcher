import React from 'react'
import {connect} from 'react-redux'

import {getPromises, getPromisesCategories} from '../../state/promises/selectors'
import {getCurrentEntity} from '../../state/ruling_entities/selectors'
import {fetchPromises} from '../../state/promises/reducer'
import PromisesCategoriesTabs from './PromisesCategoriesTabs'
import PromisesStatistics from './PromisesStatistics'


@connect(state => ({
  categories: getPromisesCategories(state),
  promises: getPromises(state),
  entity: getCurrentEntity(state)
}), {fetchPromises})
export default class PromisesModule extends React.PureComponent {
  componentDidMount() {
    this.props.fetchPromises(this.props.entity.id)
  }

  render() {
    return (
      <div>
        <PromisesCategoriesTabs categories={this.props.categories} promises={this.props.promises}/>
        <PromisesStatistics ruling_entity={this.props.entity} promises={this.props.promises}/>
      </div>
    )
  }
}
