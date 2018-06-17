import React from 'react'


class Collapsable extends React.Component {
  constructor(props) {
    super(props)
    this.state = {is_expanded: false}
    this.click_toggle_expanded = this.click_toggle_expanded.bind(this)
  }

  render() {
    return  <div className={this.props.className}>
        <div onClick={this.click_toggle_expanded}>{ this.props.trigger }</div>
        <div className={`collapsable ${this.state.is_expanded ? 'is-expanded' : ''}`}>
          { this.props.children }
        </div>
      </div>;
  }

  click_toggle_expanded(e) {
    e.preventDefault();
    return this.setState(prev_state => ({is_expanded: !prev_state.is_expanded}))
  }
}

export default Collapsable