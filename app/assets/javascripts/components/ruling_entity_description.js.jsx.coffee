class @RulingEntityDescription extends React.Component
  constructor: (props) ->
    super(props)
    @state = {logo_average_color: '#F9F9F9'}

  render: ->
    mandate_start = new Date(@props.ruling_entity.mandate_start).getFullYear()
    mandate_end = new Date(@props.ruling_entity.mandate_end).getFullYear()
    mandate_period_str = "#{mandate_start} - #{mandate_end}"

    `<div className="ruling-entity-header" style={{backgroundColor: this.state.logo_average_color}}>
        <div className='side-image-content'>
          <h1>{ this.props.ruling_entity.name }</h1>
          <h4>{ mandate_period_str }</h4>
        </div>
        <div className="images-wrapper">
          <img src={ this.props.ruling_entity.banner.url }/>
        </div>
    </div>`
