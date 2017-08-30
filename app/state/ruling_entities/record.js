import { Record } from 'immutable'


const RulingEntity = new Record({
  id: null,
  name: "",
  description: "",
  leader: "",
  mandate_start: "1991-10-12", // TODO Use datetimes
  mandate_end: "1995-10-12", // TODO Use datetimes
  thumb: null,
  banner: null
})

export default RulingEntity