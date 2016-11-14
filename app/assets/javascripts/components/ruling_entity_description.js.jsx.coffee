@RulingEntityDescription = React.createClass
  getDefaultProps: ->
    ruling_entity: {} # Todo

  render: ->
    mandate_type_i18n_key = if this.props.ruling_entity.is_current then 'period_years_current' else 'period_years_past'
    mandate_period_str = I18n.t(mandate_type_i18n_key,
      mandate_start: new Date(this.props.ruling_entity.mandate_start).getFullYear(),
      mandate_end: new Date(this.props.ruling_entity.mandate_end).getFullYear()
    )

    `<div className="side-image">
        <div className='side-image-content'>
          <h1>{ this.props.ruling_entity.name }</h1>
            <p>{ mandate_period_str }</p>
        </div>
        <div className="images-wrapper">
          <img src={ this.props.ruling_entity.banner.url }/>
        </div>
    </div>`
