import Vue from 'vue'
// import ChartDataLabels from 'chartjs-plugin-datalabels'
import { Radar, mixins } from 'vue-chartjs'
const { reactiveProp } = mixins

Vue.component('RadarChart', {
  extends: Radar,
  mixins: [reactiveProp],
  props: {
    options: {
      type: Object,
      default: () => {}
    }
  },
  mounted () {
  //  this.addPlugin(ChartDataLabels)
    this.renderChart(this.chartData, this.options)
  }
})
