import React from 'react'
import { Link } from 'gatsby'
import RulingEntityHeader from '../components/RulingEntities/RulingEntityHeader'
import slugify from 'slugify';


export default class RulingEntitiesList extends React.PureComponent {
  render() {
    return (
      <div className="ruling-entities-list">
        {this.props.data.allDataYaml.edges.map(e => 
          this.renderEntityLink(e.node)
        )}
      </div>
    )
  }

  renderEntityLink(entity) {
    const slug = slugify(entity.name)
    return (
      <Link key={slug} to={`/entities/${slug}`}>
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
