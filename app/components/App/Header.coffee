import React from "react"
import ResponsiveNavigationMenu from "./ResponsiveNavigationMenu"


class Header extends React.Component
  render: ->
    return `(
      <header className="navigation">
        <div className="navigation-wrapper">
          <a className="main-logo" href="/">
            <h1>DemocracyWatcher</h1>
            <ResponsiveNavigationMenu/>
          </a>
        </div>
      </header>
    )`

export default Header