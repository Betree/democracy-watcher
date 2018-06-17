import React from 'react'
import { Link } from 'gatsby'

import MainLayout from '../components/Layout/main_layout'

const IndexPage = () => (
  <MainLayout>
    <div className="welcome-message-container">
      <div className="welcome-message">
        <h1>Welcome to DemocracyWatcher !</h1>
        <br/>
        <p>
          This is the default home page. You want to edit this text in "app/components/Home.jsx" to present the entity
          you'll be tracking and to tell your visitors how they can contribute.
          <br/><br/>
          You can also add fancy <Link to='/entities'>links</Link> toward your content for quick access.
          <br/><br/>
          Feedback, bug report and feature requests are welcome:&nbsp;
          <a href="https://github.com/Betree/democracy-watcher">Github</a>
        </p>
        <br/>
        {/* Please keep the footer as-is to respect the GPL license (feel free to translate it if you need to) */}
        <div className="welcome-message-footer">
          <br/>
          This program is free software: you can redistribute it and/or modify
          it under the terms of the GNU General Public License as published by
          the Free Software Foundation, either version 3 of the License, or
          (at your option) any later version.
          <br/>
          {/*This program is distributed in the hope that it will be useful,*/}
          {/*but WITHOUT ANY WARRANTY; without even the implied warranty of*/}
          {/*MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*/}
          {/*GNU General Public License for more details.*/}
          See <a href="https://github.com/Betree/democracy-watcher">this link</a> for more infos.
        </div>
      </div>
    </div>
  </MainLayout>
)

export default IndexPage
