<template>
  <v-card class="mx-auto my-auto px-auto py-auto">
    <radar-chart :chart-data="chartData" :options="chartOptions" :v-bind="sakeData" />
    <div class="text-right">
      <a href="https://sakenowa.com">さけのわデータ</a>を利用しています。
    </div>
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
            stepSize: 0.1,
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
    ...mapGetters(
      'sakeData', ['sakeData', 'brandId']
    ),
    chartData () {
      return {
        datasets: [
          {
            label: 'フレーバーチャート',
            data: this.chartDataValues,
            backgroundColor: 'rgba(168, 218, 236, 0.2)',
            borderColor: 'rgba(28,171,236,1)',
            borderWidth: 1
          }
        ],
        labels: this.chartLabels
      }
    }
  },
  mounted () {
    this.chartDataValues = this.sakeData
  },
  methods: {
    getSakeData () {
      this.$axios.$get('api/v1/flavors').then(res => this.sakeDataValues.push(res))
    },
    getSakeBrand () {
      this.$axios.$get('api/v1/flavors').then(res => this.sakeDataValues.push(res))
    }
  }
}
</script>

<style scoped>
.rader-chart {
  width: 400px;
  max-height: 300px;
}
</style>
