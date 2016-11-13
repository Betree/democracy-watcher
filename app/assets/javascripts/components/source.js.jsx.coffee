class @Source extends React.Component
  render: ->
    console.log this.props.source
    `<div>
        <span>{this.props.source.media} - </span>
        <a href={this.props.source.url}>{this.props.source.title}</a>
    </div>`
