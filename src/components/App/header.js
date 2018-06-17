import React from 'react'
import { Link } from 'gatsby'

import NavigationMenu from './navigation_menu'

const Header = ({ siteTitle, entities, selectedEntity }) => (
  <header className="navigation">
  <div className="navigation-wrapper">
    <Link className="main-logo" to="/">
      <h1>{siteTitle}</h1>
    </Link>
    <NavigationMenu entities={entities} selected={selectedEntity}/>
  </div>
</header>
)

export default Header
