class @Promise extends React.PureComponent
  render: ->
    `<Collapsable
        trigger={
            <div className="promise-header">
              <div className='status'>
                <i className={'fa status-' + this.props.promise.status}
                   title={I18n.t('models.promise.status.' + this.props.promise.status)}/>
              </div>
              <div className="title">{this.props.promise.title}</div>
            </div>
          }
        children={
            <div className="more-infos">
              { this.props.promise.description &&
                  <div  className="description"
                        dangerouslySetInnerHTML={{__html: this.props.promise.description}}/>
              }
              <Sources sources={this.props.promise.sources}/>
            </div>
          }
      />`


