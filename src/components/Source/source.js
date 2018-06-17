import React from 'react'

export default class Source extends React.PureComponent {
  render() {
    const {url, title, media} = this.props.source

    if (url && title && media) {
      return <div>
          <span>{media}</span>
          <span> - </span>
          <a href={url}>{title}</a>
      </div>
    } else if (url && (title || media)) {
      return <div>
          <a href={url}><span>
            {title ? title : media}
          </span></a>
      </div>
    } else if (url) {
      return <div>
        <a href={url}>{media}</a>
      </div>
    } else {
      return null
    }
  }
}
