export const state = () => ({
  sakeData: [],
  brandId: []
})

export const getters = {
  sakeData: state => state.sakeData,
  brandId: state => state.brandId
}

export const mutations = {
  addSakeData: (state, sakeData) => {
    const dataArray = []
    dataArray.push(sakeData.f1)
    dataArray.push(sakeData.f2)
    dataArray.push(sakeData.f3)
    dataArray.push(sakeData.f4)
    dataArray.push(sakeData.f5)
    dataArray.push(sakeData.f6)
    state.sakeData = dataArray
    state.brandId = sakeData.brandId
  }
}

export const actions = {
  createSakeData ({ commit }, sakeData) {
    return this.$axios.$post('/api/v1/sakedata', { sakedata: sakeData })
      .then(res => commit('addSakeData', res)
      )
  }
}
