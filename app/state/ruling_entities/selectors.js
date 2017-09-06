import {createSelector} from 'reselect'
import {getCurrentLocation} from '../misc_selectors'


const ENTITY_URL_REGEX = /\/entities\/([^\/]+)(\/.+)?/

// Public API
export const getRulingEntities = state => state.RulingEntities.entities

export const getCurrentEntityId = createSelector(
  getCurrentLocation,
  location => {
    const res = ENTITY_URL_REGEX.exec(location.pathname)
    return res ? res[1] : null
  }
)

export const getCurrentEntity = createSelector(
  getRulingEntities, getCurrentEntityId,
  (entities, entityId) => (entityId && entities.find(e => e.id === entityId)) || null
)

