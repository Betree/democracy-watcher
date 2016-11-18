class @ResponsiveNavigationMenu extends React.PureComponent
  @propTypes =
    title: React.PropTypes.string

  render: ->
    # TODO: Generate menu links from here
    ` <div>
        <Collapsable className='collapsable-menu' trigger={ <span className="navigation-menu-button">MENU</span> }>
            <nav role='navigation'>
                <ul className="navigation-menu">
                    { this.props.links.map((link) =>
                    <li key={link} className="nav-link" dangerouslySetInnerHTML={{__html: link}}/>
                        )}
                </ul>
            </nav>
        </Collapsable>
      </div>`

