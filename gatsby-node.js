/**
 * Implement Gatsby's Node APIs in this file.
 *
 * See: https://www.gatsbyjs.org/docs/node-apis/
 */

 // You can delete this file if you're not using it

const path = require('path')
const yaml = require('js-yaml')
var slugify = require('slugify')
const uuidv4 = require('uuid/v4')


exports.createPages = ({graphql, boundActionCreators}) => {
  const { createPage } = boundActionCreators
  return new Promise((resolve, reject) => {
    resolve(
      graphql(
        `
        {
          allDataYaml {
            edges {
              node {
                id
                name
                leader
                mandate_start
                mandate_end
                description
                thumb
                banner
                promises {
                  title
                  category
                  subject
                  status
                  description
                  sources {
                    media
                    url
                    title
                  }
                }
              }
            }
          }
        }
        `
      ).then(result => {
        if (result.errors) {
          reject(result.errors)
        }

        const RulingEntityPresentation = path.resolve(`src/templates/ruling_entity_presentation.js`)
        const RulingEntityPromises = path.resolve(`src/templates/ruling_entity_promises.js`)

        result.data.allDataYaml.edges.forEach(edge => {
          const entitySlug = slugify(edge.node.name)
          const fullEntity = {
            ...edge.node, 
            id: uuidv4(),
            slug: entitySlug, 
            promises: edge.node.promises.map(p => ({
              ...p, 
              id: uuidv4(),
              status: p.status.toLowerCase(),
              sources: p.sources ? p.sources.map(s => ({
                ...s,
                id: uuidv4(),
              })) : []
            }))
          }

          // Create page for entity presentation
          createPage({
            path: `/entities/${entitySlug}`,
            component: RulingEntityPresentation,
            context: {
              entity: fullEntity
            }
          })

          // Entity promises
          createPage({
            path: `/entities/${entitySlug}/promises`,
            component: RulingEntityPromises,
            context: {
              entity: fullEntity
            }
          })          
        })
      })
    )
  })
}
