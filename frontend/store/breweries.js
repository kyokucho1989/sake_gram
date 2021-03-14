export const state = () => ({
  breweries: []
})

export const getters = {
  breweries: state => state.breweries
}

export const mutations = {
  setBreweries: (state, breweries) => {
    state.breweries = breweries
  }
}

export const actions = {
  fetchBrewery ({ commit }, breweryId) {
    return this.$axios.$get(`/api/v1/breweries/${breweryId}`)
      .then(res => commit('setBreweries', res))
  }
}
