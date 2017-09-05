import { Record, Map, List } from "immutable"
import { createAction, handleActions } from 'redux-actions'

import Promise from './record'
import Source from './source_record'
import API from '../../api'


// Actions
export const fetchPromises = createAction('PROMISES/FETCH', entity => API.get(`${entity}/promises`))

// Initial state
const INITIAL_STATE = new Record({
  error: null,
  isLoading: false,
  promises: new Map()
})

// Reducer
const PromisesReducer = handleActions({
  [fetchPromises]: {
    next: (state, {payload}) => {
      let promises = new Map()
      for (let [category, categoryPromises] of Object.entries(payload))
        promises = promises.set(category, new List(categoryPromises).map(p => new Promise(p)))

      return state.mergeDeep({promises, error: null, isLoading: false})
    },
    throw: (state, {payload}) => state.merge({error: payload, isLoading: false})
  }
}, INITIAL_STATE())

export default PromisesReducer