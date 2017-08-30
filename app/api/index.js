import yaml from 'js-yaml'

export default class API {
  static get(path) {
    return new Promise((fulfill, reject) => {
      fetch(`/data/${path}.yaml`)
        .then(response => response.text().then(body => {
          const data = yaml.safeLoad(body)
          return fulfill(data)
        }))
    })
  }
}