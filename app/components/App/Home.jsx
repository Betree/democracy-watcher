import React from 'react'
import {Link} from 'react-router-dom'


const Home = () =>
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
        Feedback, bug report and feature requests are welcome:
        <a href="https://github.com/Betree/democracy-watcher">Github</a>
      </p>
      <br/>
      {/* Please keep the footer as-is to help people find the root project */}
      <div className="welcome-message-footer">
        This project uses DemocracyWatcher, distributed under MIT license. You can use it, clone it
        and modify it freely.
        See <a href="https://github.com/Betree/democracy-watcher">Github</a> for more infos.
      </div>
    </div>
  </div>

export default Home