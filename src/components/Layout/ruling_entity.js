import React from 'react'

import MainLayout from '../Layout/main_layout'
import RulingEntityHeader from '../RulingEntities/RulingEntityHeader'


const RulingEntityLayout = ({entity, children}) => (
  <MainLayout selectedEntity={entity}>
    <RulingEntityHeader ruling_entity={entity}/>
    <div className="ruling-entity-data-container">
      <div className="ruling-entity-data">
        {children}
      </div>
    </div>
  </MainLayout>
)

export default RulingEntityLayout