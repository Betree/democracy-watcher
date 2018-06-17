import React from 'react'
import I18n from 'i18n-js'


const RulingEntityTitle = ({entity: {name, leader, id}}) => {
  let title = ""
  if (name && leader)
    title = I18n.t('entity_full_title', {name: name, leader: leader})
  else if (name)
    title = name
  else if (leader)
    title = leader
  else
    title = id
  return <span>{title}</span>
}

export default RulingEntityTitle