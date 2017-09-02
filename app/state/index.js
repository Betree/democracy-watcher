import { createStore, combineReducers, applyMiddleware, compose } from "redux"
import promiseMiddleware from 'redux-promise'
import thunk from 'redux-thunk'
import { routerReducer, routerMiddleware } from 'react-router-redux'
import history from '../history'

import RulingEntitiesReducer from './ruling_entities/reducer'
import PromisesReducer from './promises/reducer'


// Declare reducers
const reducers = combineReducers({
  RulingEntities: RulingEntitiesReducer,
  Promises: PromisesReducer,
  router: routerReducer
})

// Build store
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose
const store = createStore(reducers, composeEnhancers(applyMiddleware(
  thunk,
  promiseMiddleware,
  routerMiddleware(history)
)))

export default store