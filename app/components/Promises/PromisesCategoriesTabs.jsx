import React from 'react'
import {connect} from 'react-redux'
import I18n from "i18n-js"

import {TabsView} from '../Utils/TabsView'
import {getPromises, getPromisesCategories} from '../../state/promises/selectors'
import {fetchPromises} from '../../state/promises/reducer'
import {getCurrentEntity} from '../../state/ruling_entities/selectors'
import PromisesList from './PromisesList'

@connect(state => ({
  categories: getPromisesCategories(state),
  promises: getPromises(state),
  entity: getCurrentEntity(state)
}), {fetchPromises})
export default class PromisesCategoriesTabs extends React.PureComponent {
  componentDidMount() {
    this.props.fetchPromises(this.props.entity.id)
  }

  render() {
    // Categorize promises in an object
    const promisesTabs = []
    for(let category of this.props.categories) {
      const promisesList = <PromisesList promises={this.props.promises.get(category)}/>
      const categoryLabel = I18n.t(`models.promise_subject.category.${category.toLowerCase()}`)
      promisesTabs.push(TabsView.create_tab(category, categoryLabel, promisesList))
    }

    // const promises_tabs = for category, promises of categorized_promises
    //   const local_category = I18n.t("models.promise_subject.category.#{category}")
    //   TabsView.create_tab(category, local_category, ``)

    return <TabsView className="tabs-view" tabs={promisesTabs}/>
  }
}