import { Record } from 'immutable'
import uuidv4 from 'uuid/v4'


export default class Source extends Record({
  id: "",
  media: "",
  url: "",
  title: ""
}) {
  constructor(values) {
    super(Object.assign(values, {id: uuidv4()}))
  }
}
