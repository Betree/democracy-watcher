class @ProgressBar extends React.Component
  @propTypes =
    progress: React.PropTypes.number

  constructor: (props) ->
    super(props)
    @state = {progress: @props.progress ? 0}

  render: ->
    progress_style =
      width: "#{@state.progress}%"
    `<div className="progress-bar-indication">
        <span className="meter" style={progress_style}><p></p></span>
    </div>`
