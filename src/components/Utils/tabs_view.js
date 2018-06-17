import React from 'react'


export default class TabsView extends React.Component {
  state = {currentActiveTab: null} 

  render() {
    return (
      <ul className={`accordion-tabs-minimal ${this.props.className}`}>
        { this.props.tabs.map((tab) =>
          <ReactTab key={tab.key} title={tab.title} content={tab.content}
                    initial_active_state={tab === this.props.tabs[0]}
                    select_tab={t => this.select_tab(t)}
          />
        )}
      </ul>
    )
  }

  select_tab(tab) {
    if (tab !== this.state.current_active_tab) {
      tab.set_active(true)
      if (this.state.current_active_tab)
        this.state.current_active_tab.set_active(false)
      this.setState({current_active_tab: tab})
    }
  }

  static create_tab(key, title, content) {
    return new Tab(key, title, content)
  }
}

/*
Dummy object to hold value of a tab before creating a React object with it
*/
class Tab {
  constructor(key, title, content) {
    this.key = key;
    this.title = title;
    this.content = content;
  }
}


/*
Don't create Tab directly, use TabsView.create_tab
*/
class ReactTab extends React.Component {
  constructor(props) {
    super(props);
    this.on_click = this.on_click.bind(this);
    this.state = {is_active: false};
  }

  render() {
    return  <li className="tab-header-and-content">
        <a className={`tab-link ${this.state.is_active ? 'is-active' : ''}`}
           onClick={this.on_click}
        >
            { this.props.title }
        </a>
        <div className={`tab-content ${this.state.is_active ? 'is-open' : ''}`}>
            { this.props.content }
        </div>
    </li>;
  }

  componentDidMount() {
    if (this.props.initial_active_state) {
      return this.props.select_tab(this);
    }
  }

  on_click(e) {
    return this.props.select_tab(this);
  }

  set_active(is_active) {
    return this.setState({is_active});
  }
}
