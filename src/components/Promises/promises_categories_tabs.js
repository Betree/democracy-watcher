import React from 'react'

import TabsView from '../Utils/tabs_view'
import PromisesList from './promises_list'


const PromisesCategoriesTabs = ({categories, promises}) => {
  // Categorize promises in an object
  const promisesTabs = []

  for(let category of categories) {
    const promisesList = <PromisesList promises={promises[category]}/>
    promisesTabs.push(TabsView.create_tab(category, category, promisesList))
  }
  return <TabsView className="tabs-view" tabs={promisesTabs}/>
}

export default PromisesCategoriesTabs