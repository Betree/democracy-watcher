import { createStore, combineReducers, applyMiddleware, compose } from "redux"
import promiseMiddleware from 'redux-promise'
import thunk from 'redux-thunk'
import { routerReducer, routerMiddleware } from 'react-router-redux'
import history from '../history'

import RulingEntitiesReducer from './ruling_entities/reducer'


# Declare reducers
reducers = combineReducers
  RulingEntities: RulingEntitiesReducer,
  router: routerReducer

# Build store
composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose
store = createStore(reducers, composeEnhancers(applyMiddleware(
  thunk,
  promiseMiddleware,
  routerMiddleware(history)
)))

export default store