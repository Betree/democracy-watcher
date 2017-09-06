import {List, Map, Record} from 'immutable'
import uuidv4 from 'uuid/v4'

import Source from './source_record'

const STATUS_ALIASES = new Map({
  todo: 'not_yet_started'
})

export default class Promise extends Record({
  id: "",
  title: "",
  subject: null,
  status: "not_yet_started", // Can be TODO, IN_PROGRESS, DONE or BROKEN
  description: "",
  sources: new List()
}) {
  constructor(values) {
    const status = values.status ? Promise.statusFormat(values.status) : null
    const sources = values.sources ? new List(values.sources).map(s => new Source(s)) : new List()
    super(Object.assign(values, {id: uuidv4(), status, sources}))
  }

  static statusFormat(status) {
    status = status.toLowerCase()
    return STATUS_ALIASES.has(status) ? STATUS_ALIASES.get(status) : status
  }
}
