class @PromisesList extends React.Component
  render: ->
    `<ul className="accordion">
        { this.props.promises.map((promise) =>
          <li className={"promise " + promise.status} key={promise.id}>
            <Promise promise={promise}/>
          </li>
        )}
    </ul>`
