import slugify from "slugify"


export const entityUrl = (entity) => 
  `/entities/${slugify(entity.name)}`

export const promisesUrl = (entity) =>
  `${entityUrl(entity)}/promises`