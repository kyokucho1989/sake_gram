export const state = () => ({
  flavors: []
})

export const getters = {
  flavors: state => state.flavors
}

export const mutations = {
  addFlavors (state, res) {
    state.flavors = res
  }
}
