import {createSelector} from 'reselect'
import {List} from 'immutable'

export const getPromises = state => state.Promises.promises
export const getPromisesCategories = createSelector(getPromises, p => p.keys())
export const getPromisesList = createSelector(getPromises, p => {
  let promisesList = new List()
  for (let promises of p.values())
    promisesList = promisesList.concat(promises)
  return promisesList
})