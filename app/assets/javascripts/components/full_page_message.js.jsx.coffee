class @FullPageMessage extends React.Component
  @propTypes =
    title: React.PropTypes.string
    message: React.PropTypes.string
    imageUrl: React.PropTypes.string
    type: React.PropTypes.string

  render: ->
    `<div className={ "fullPageMessage " + this.props.type }>
      <div className="message-title">{ " " + this.props.title}</div>
      {this.props.imageUrl &&
          <img src={this.props.imageUrl}/>}
      <div>{this.props.message}</div>
    </div>`
