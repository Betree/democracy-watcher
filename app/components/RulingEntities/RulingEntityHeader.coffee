import React from 'react'

import RulingEntityTitle from './RulingEntityTitle'


class RulingEntityHeader extends React.Component
  constructor: (props) ->
    super(props)
    @state = {logo_average_color: '#F9F9F9'}

  render: ->
    mandate_start = new Date(@props.ruling_entity.mandate_start).getFullYear()
    mandate_end = new Date(@props.ruling_entity.mandate_end).getFullYear()
    mandate_period_str = "#{mandate_start} - #{mandate_end}"
    style = {}
    if @props.ruling_entity.banner
      style['backgroundImage'] = "url(#{@props.ruling_entity.banner})"

    `<div className="ruling-entity-header" style={style}>
        <div className='side-image-content'>
          <div className="entity-description">
            <h1><RulingEntityTitle entity={this.props.ruling_entity}/></h1>
            <h4 className='date-interval'>{ mandate_period_str }</h4>
          </div>
        </div>
        <div className="images-wrapper">
          {this.props.ruling_entity.thumb &&
            <img src={ this.props.ruling_entity.thumb }/>
          }
        </div>
    </div>`


export default RulingEntityHeader