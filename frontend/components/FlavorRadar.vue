<template>
  <v-card class="mx-auto my-auto px-auto py-auto">
    <radar-chart :chart-data="chartData" :options="chartOptions" :v-bind="flavors" />
  </v-card>
</template>

<script>
import { mapGetters } from 'vuex'
import colors from 'vuetify/es5/util/colors'

export default {
  data () {
    return {
      flavorDataValues: [],
      chartDataValues: [],
      chartColors: [
        colors.blue.lighten3
      ],
      chartLabels: ['華やか', '芳醇', '重厚', '穏やか', 'ドライ', '軽快'],
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
            stepSize: 0.2,
            max: 1,
            beginAtZero: true
          }
        }
      }
    }
  },
  computed: {
    ...mapGetters(
      'flavors', ['flavors']
    ),
    chartData () {
      return {
        datasets: [
          {
            label: 'フレーバーチャート',
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
    this.chartDataValues = this.flavors
  }
}
</script>

<style scoped>
.rader-chart {
  width: 400px;
  max-height: 300px;
}
</style>
