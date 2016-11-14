class @Source extends React.Component
  render: ->
    `<div>
        <span>{this.props.source.media} - </span>
        <a href={this.props.source.url}>{this.props.source.title}</a>
    </div>`
