import React from 'react'

import {TabsView} from '../Utils/TabsView'
import PromisesList from './PromisesList'


const PromisesCategoriesTabs = ({categories, promises}) => {
  // Categorize promises in an object
  const promisesTabs = []
  for(let category of categories) {
    const promisesList = <PromisesList promises={promises.get(category)}/>
    promisesTabs.push(TabsView.create_tab(category, category, promisesList))
  }
  return <TabsView className="tabs-view" tabs={promisesTabs}/>
}

export default PromisesCategoriesTabs