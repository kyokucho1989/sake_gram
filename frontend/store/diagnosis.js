export const state = () => ({
  diagnosisData: [
    { id: 1, name: '外向性', img: require('@/assets/gaiko.png'), comment: '' },
    { id: 2, name: '情緒安定性', img: require('@/assets/jocho.png'), comment: '' },
    { id: 3, name: '開放性', img: require('@/assets/kaiho.png'), comment: '' },
    { id: 4, name: '誠実性', img: require('@/assets/seijitsu.png'), comment: '' },
    { id: 5, name: '調和性', img: require('@/assets/chowa.png'), comment: '' }
  ]
})

export const getters = {
  diagnosisData: state => state.diagnosisData
}

export const mutations = {
  addDiagnosis (state, res) {
    for (let i = 0; i < 5; i++) {
      if (res.attributes.name === state.diagnosisData[i].name) {
        state.diagnosisData[i].comment = res.attributes.comment
      }
    }
  }
}
