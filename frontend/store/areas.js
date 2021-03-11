export const state = () => ({
  areas: []
})

export const getters = {
  areas: state => state.areas
}

export const mutations = {
  setAreas: (state, areas) => {
    console.log(areas)
    state.areas = areas
  }
}

export const actions = {
  fetchArea ({ commit }, areaId) {
    return this.$axios.$get(`/api/v1/areas/${areaId}`)
      .then(res => commit('setAreas', res))
  }
}
