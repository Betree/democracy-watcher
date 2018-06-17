import React from 'react'
import { Link } from 'gatsby'
import RulingEntityHeader from '../components/RulingEntities/RulingEntityHeader'
import MainLayout from '../components/Layout/main_layout'
import { entityUrl } from '../lib/url_utils'


export default class RulingEntitiesList extends React.PureComponent {
  render() {
    return (
      <MainLayout>
        <div className="ruling-entities-list">
          {this.props.data.allDataYaml.edges.map(e => 
            this.renderEntityLink(e.node)
          )}
        </div>
      </MainLayout>
    )
  }

  renderEntityLink(entity) {
    return (
      <Link key={entity.id} to={entityUrl(entity)}>
        <RulingEntityHeader ruling_entity={entity}/>
      </Link>
    )
  }
}

export const query = graphql`
query EntitiesListQuery {
  allDataYaml {
    edges {
      node {
        name
        leader
        mandate_start
        mandate_end
        description
        thumb
        banner
      }
    }
  }
}
`
