import { Record, List } from 'immutable'
import uuidv4 from 'uuid/v4'

export default class Promise extends Record({
  id: "",
  title: "",
  subject: null,
  status: "TODO", // Can be TODO, IN_PROGRESS, DONE or BROKEN
  description: "",
  sources: new List()
}) {
  constructor(values) {
    const status = values.status ? values.status.toLowerCase() : null
    super(Object.assign(values, {id: uuidv4(), status}))
  }
}
