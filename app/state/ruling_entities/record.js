import {List, Record} from 'immutable'


const RulingEntity = new Record({
  id: null,
  name: "",
  description: "",
  leader: "",
  mandate_start: "1991-10-12",
  mandate_end: "1995-10-12",
  thumb: null,
  banner: null,
  modules: new List()
})

export default RulingEntity