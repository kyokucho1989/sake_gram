<template>
  <v-card class="mx-auto my-auto px-auto py-auto">
    <radar-chart :chart-data="chartData" :options="chartOptions" :v-bind="results" />
  </v-card>
</template>

<script>
import { mapGetters } from 'vuex'
import colors from 'vuetify/es5/util/colors'

export default {
  data () {
    return {
      chartDataValues: [],
      chartColors: [
        colors.blue.lighten3
      ],
      chartLabels: ['外向性', '情緒安定性 ', '開放性', '誠実性', ' 調和性'],
      chartOptions: {
        maintainAspectRation: false,
        animation: {
          duration: 1500,
          easing: 'easeInOutCubic'
        },
        scale: {
          pointLabels: {
            fontSize: 15
          },
          gridLines: {
            color: 'rgba(91, 191, 234, 0.1)'
          },
          ticks: {
            display: false,
            stepSize: 2,
            max: 10,
            beginAtZero: true
          }
        }
      }
    }
  },
  computed: {
    ...mapGetters(
      'results', ['results']
    ),
    chartData () {
      return {
        datasets: [
          {
            label: '性格診断結果',
            data: this.chartDataValues,
            backgroundColor: 'rgba(168, 218, 236, 0.2)',
            borderColor: 'rgba(28,171,236,1)',
            borderWidth: 2
          }
        ],
        labels: this.chartLabels
      }
    }
  },
  mounted () {
    this.chartDataValues = this.results
  }
}
</script>

<style scoped>
.rader-chart {
  width: 400px;
  max-height: 300px;
}
</style>
