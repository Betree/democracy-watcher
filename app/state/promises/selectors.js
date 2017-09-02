import { createSelector } from 'reselect'

export const getPromises = state => state.Promises.promises
export const getPromisesCategories = createSelector(getPromises, p => p.keys())
