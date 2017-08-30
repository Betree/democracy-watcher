import { Record, List } from "immutable"
import { createAction, handleActions } from 'redux-actions'

import RulingEntity from './record'
import API from '../../api'


// Actions
// TODO Fetch API
export const fetchRulingEntities = createAction('RULING_ENTITIES/FETCH', () => API.get("ruling_entities"))

// Initial state
const INITIAL_STATE = new Record({
  error: null,
  isLoading: false,
  entities: new List()
})

// Reducer
const RulingEntitiesReducer = handleActions({
  [fetchRulingEntities]: {
    next: (state, {payload: {entities}}) =>
      state.mergeDeep({
        entities: new List(entities).map(e => RulingEntity(e)),
        error: null,
        isLoading: false
      }),
    throw: (state, {payload}) => state.merge({error: payload, isLoading: false})
  }
}, INITIAL_STATE())

export default RulingEntitiesReducer