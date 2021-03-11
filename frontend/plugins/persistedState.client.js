import createPersistedState from 'vuex-persistedstate'

export default ({ store }) => {
  createPersistedState({
    key: 'SAKEGRAM',
    storage: window.sessionStorage
  })(store)
}
