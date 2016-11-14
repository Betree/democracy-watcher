class @Promise extends React.Component
  constructor: (props) ->
    super(props)
    this.state = {isExpended: false}

  render: ->
    # Build sources list
    sources = []
    for source in this.props.promise.sources
      sources.push(`<li key={source.id}><Source source={source}/></li>`)

    `<div>
        <div className="promise-header" onClick={this.click_show_more_info}>
          <div className='status'>
            <i className={'fa status-' + this.props.promise.status}
               title={I18n.t('promise.status.' + this.props.promise.status)}/>
          </div>
          <div className="title">{this.props.promise.title}</div>
        </div>
        <div className={"more-infos " + (this.state.isExpended ? 'is-expanded' : '')}>
          { this.props.promise.description &&
              <div className="description">{this.props.promise.description}</div>
          }
          <div className="sources">
            { sources.length ? <ul>Sources :{ sources }</ul> : sources = I18n.t('no_source') }
          </div>
        </div>
    </div>`

  click_show_more_info: (e) =>
    e.preventDefault()
    this.setState (prevState) ->
      {isExpended: !prevState.isExpended}

