import React from 'react'
import I18n from 'i18n-js'


const RulingEntityShortTitle = ({entity: {name, leader, id}}) => {
  let title = ""
  if (name && leader)
    title = `${name} (${leader})`
  else if (name)
    title = name
  else if (leader)
    title = leader
  else
    title = id
  return <span>{title}</span>
}

export default RulingEntityShortTitle