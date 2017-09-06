import React from 'react'

export class Source extends React.PureComponent
  render: ->
    if @props.source.url and @props.source.title and @props.source.media
      `<div>
          <span>{this.props.source.media}</span>
          <span> - </span>
          <a href={this.props.source.url}>{this.props.source.title}</a>
      </div>`

    else if @props.source.url and (@props.source.title or @props.source.media)
      `<div>
          <a href={this.props.source.url}><span>
            {this.props.source.title ? this.props.source.title : this.props.source.media}
          </span></a>
      </div>`

    else if @props.source.url
      `<div>
        <a href={this.props.source.url}>{this.props.source.media}</a>
      </div>`

    else
      `<div/>`
