import React from 'react';

class ProgressBar extends React.Component {
  state = {progress: this.props.progress != null ? this.props.progress : 0}

  render() {
    const progress_style = {width: `${this.state.progress}%`}
    return (
      <div className="progress-bar-indication">
        <span className="meter" style={progress_style}><p></p></span>
      </div>
    )
  }
}

export default ProgressBar