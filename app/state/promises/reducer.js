import { Record, Map } from "immutable"
import { createAction, handleActions } from 'redux-actions'

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
    next: (state, {payload: {promises}}) =>
      state.mergeDeep({
        promises: new Map(promises),
        error: null,
        isLoading: false
      }),
    throw: (state, {payload}) => state.merge({error: payload, isLoading: false})
  }
}, INITIAL_STATE())

export default PromisesReducer