class @Promise extends React.PureComponent
  render: ->
    # Build sources list
    sources = []
    for source in this.props.promise.sources
      sources.push(`<li key={source.id}><Source source={source}/></li>`)

    `<Collapsable
        trigger={
            <div className="promise-header">
              <div className='status'>
                <i className={'fa status-' + this.props.promise.status}
                   title={I18n.t('promise.status.' + this.props.promise.status)}/>
              </div>
              <div className="title">{this.props.promise.title}</div>
            </div>
          }
        children={
            <div className={"more-infos"}>
              { this.props.promise.description &&
                  <div className="description">{this.props.promise.description}</div>
              }
              <div className="sources">
                { sources.length ? <ul>Sources :{ sources }</ul> : sources = I18n.t('no_source') }
              </div>
            </div>
          }
      />`


