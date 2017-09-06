export default class API {
  static get(path) {
    return new Promise((fulfill, reject) => {
      fetch(`/data/${path}.json`)
        .then(response => response.text().then(body => {
          const data = JSON.parse(body)
          return fulfill(data)
        }))
    })
  }
}