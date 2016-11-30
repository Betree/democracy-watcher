class @Leader extends React.Component
  @propTypes =
    statements_count: React.PropTypes.number

  render: ->
    statement_label = (I18n.t 'models.leader_statement', count: @props.statements_count)
    text_description = "#{@props.statements_count} #{statement_label.toLowerCase()}"
    `<div className="leader">
      {this.props.leader.picture.url &&
       <img src={this.props.leader.picture.thumb.url} alt={this.props.leader.name}/>
      }
      <h2 className="leader-name">{this.props.leader.name}</h2>
      <div>{ text_description }</div>
    </div>`
