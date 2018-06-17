import React from 'react'
import Helmet from 'react-helmet'
import { StaticQuery } from 'gatsby'

import "../../translations/en"
import Header from '../App/header'

import '../../styles/application.sass'

const MainLayout = ({ children, selectedEntity }) => (
  <StaticQuery
    query={graphql`
      query LayoutQuery {
        site {
          siteMetadata {
            title
          }
        }
        allDataYaml {
          edges {
            node {
              name
              leader
              mandate_start
              mandate_end
              thumb
            }
          }
        }
      }
    `}
    render={data => (
      <>
        <div>
          <Helmet
            title={data.site.siteMetadata.title}
            meta={[
              { name: 'description', content: 'Sample' },
              { name: 'keywords', content: 'sample, something' },
            ]}
          />
          <Header 
            siteTitle={data.site.siteMetadata.title}
            entities={data.allDataYaml.edges.map(e => e.node)}
            selectedEntity={selectedEntity}
          />
          <div>
            {children}
          </div>
        </div>
      </>
    )}
  />
)

export default MainLayout
