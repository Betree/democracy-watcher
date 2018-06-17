import React from 'react'
import groupBy from 'lodash.groupby'

import RulingEntityLayout from '../components/Layout/ruling_entity'
import PromisesCategoriesTabs from '../components/Promises/promises_categories_tabs'
import PromisesStatistics from '../components/Promises/promises_statistics'


export default class RulingEntityPromises extends React.PureComponent {
  render() {
    const {pageContext: {entity}} = this.props
    const groupedPromises = groupBy(entity.promises, 'category')

    return (
      <RulingEntityLayout entity={entity}>
        <PromisesCategoriesTabs 
          categories={Object.keys(groupedPromises)} 
          promises={groupedPromises}
        />
        <PromisesStatistics 
          ruling_entity={entity}
          promises={entity.promises}
        />
      </RulingEntityLayout>
    )
  }
}
