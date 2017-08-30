import React from "react"
import NavigationMenu from "./NavigationMenu"
import { Link } from 'react-router-dom'


export default class Header extends React.PureComponent {
  render() {
    return (
      <header className="navigation">
        <div className="navigation-wrapper">
          <Link className="main-logo" to="/">
            <h1>DemocracyWatcher</h1>
          </Link>
          <NavigationMenu/>
        </div>
      </header>
    )
  }
}