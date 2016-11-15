@RulingEntityDescription = React.createClass
  getDefaultProps: ->
    ruling_entity: {} # Todo

  render: ->
    mandate_start = new Date(this.props.ruling_entity.mandate_start).getFullYear()
    mandate_end = new Date(this.props.ruling_entity.mandate_end).getFullYear()
    mandate_period_str = "#{mandate_start} - #{mandate_end}"

    `<div className="ruling-entity-header">
        <div className='side-image-content'>
          <h1>{ this.props.ruling_entity.name }</h1>
          <h4>{ mandate_period_str }</h4>
        </div>
        <div className="images-wrapper">
          <img src={ this.props.ruling_entity.banner.url }/>
        </div>
    </div>`
