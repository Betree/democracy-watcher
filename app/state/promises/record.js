import { Record } from 'immutable'

const Promise = new Record({
  title: "",
  status: "TODO", // Can be TODO, IN_PROGRESS, DONE or BROKEN
  description: "",
})

export default Promise