<template>
    <v-container
    style="max-width: 1030px;
    margin: 0 auto;"
  >
    <v-row  justify="center" align-content="center">
    <div class="text-center" style="font-size: 26px">
      あなたを日本酒に例えると、、、
      <br />
      <h1>{{ brands[0] }}</h1>です！！
    </div>
    </v-row>
    <v-row>
       <v-col
        cols="12"
        xs="12"
        sm="12"
        md="12"
        lg="12"
      >
        <SakeDetail />
       </v-col>
    </v-row>
    <v-row justify="center" align-content="center">
      <v-col
        cols="12"
        xs="12"
        sm="12"
        md="12"
        lg="12"
      >
        <v-btn-toggle
          tile
          color="blue accent-3"
          background-color="blue"
          group
        >
          <v-btn value="left" @click="hadleShowResultsRadar">
            診断結果
          </v-btn>
          <v-btn value="center" @click="hadleShowFlavorRadar">
            性格
          </v-btn>
          <v-btn value="right" @click="hadleShowSakeData">
            フレーバー
          </v-btn>
        </v-btn-toggle>
        <ResultsRadar
          v-if="isVisibleResultsRadar"
        />
        <FlavorRadar
          v-if="isVisibleFlavorRadar"
        />
        <SakeData
          v-if="isVisibleSakeData"
        />
      </v-col>
      <Diagnosis />
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex'
import Diagnosis from '../components/Diagnosis'
import ResultsRadar from '../components/ResultsRadar'
import FlavorRadar from '../components/FlavorRadar'
import SakeData from '../components/SakeData'
import SakeDetail from '../components/SakeDetail'

export default {
  data () {
    return {
      isVisibleResultsRadar: true,
      isVisibleFlavorRadar: false,
      isVisibleSakeData: false,
      isVisibleSakeDetail: false
    }
  },
  component: {
    Diagnosis,
    ResultsRadar,
    FlavorRadar,
    SakeData,
    SakeDetail
  },
  computed: {
    ...mapGetters(
      'brands', ['brands']
    ),
    ...mapGetters(
      'sakeData', ['brandId']
    )
  },
  methods: {
    hadleShowResultsRadar () {
      this.isVisibleResultsRadar = true
      this.isVisibleFlavorRadar = false
      this.isVisibleSakeData = false
      this.isVisibleSakeDetail = false
    },
    hadleShowFlavorRadar () {
      this.isVisibleResultsRadar = false
      this.isVisibleFlavorRadar = true
      this.isVisibleSakeData = false
      this.isVisibleSakeDetail = false
    },
    hadleShowSakeData () {
      this.isVisibleResultsRadar = false
      this.isVisibleFlavorRadar = false
      this.isVisibleSakeData = true
      this.isVisibleSakeDetail = false
    },
    hadleShowSakeDetail () {
      this.isVisibleResultsRadar = false
      this.isVisibleFlavorRadar = false
      this.isVisibleSakeData = false
      this.isVisibleSakeDetail = true
    }
  }
}
</script>

<style scoped>
h1{
font-family: 'Sawarabi Mincho', sans-serif;
}
</style>
