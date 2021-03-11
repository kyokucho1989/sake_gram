export const state = () => ({
  brands: []
})

export const getters = {
  brands: state => state.brands
}

export const mutations = {
  setBrands: (state, brands) => {
    state.brands = brands
  }
}

export const actions = {
  fetchBrand ({ commit }, id) {
    return this.$axios.$get(`/api/v1/brands/${id}`)
      .then(res => commit('setBrands', res))
  }
}
