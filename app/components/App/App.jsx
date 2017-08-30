import React from "react"
import { connect } from 'react-redux'
import { Route } from 'react-router'
import { ConnectedRouter } from 'react-router-redux'

import history from '../../history'
import { fetchRulingEntities } from '../../state/ruling_entities/reducer'
import Header from './Header'
import Home from './Home'
import RulingEntitiesList from '../RulingEntities/RulingEntitiesList'
import RulingEntity from '../RulingEntities/RulingEntity'


@connect(null, {fetchRulingEntities})
export default class App extends React.PureComponent {
  componentDidMount() {
    this.props.fetchRulingEntities()
  }

  render() {
    return (
      <ConnectedRouter history={history}>
        <div className="app">
          <Header/>

          <Route exact path="/" component={Home}/>
          <Route exact path="/entities" component={RulingEntitiesList}/>
          <Route path="/entities/:entity_id" component={RulingEntity}/>
        </div>
      </ConnectedRouter>
    )
  }
}
