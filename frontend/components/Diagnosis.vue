<template>
  <v-row align-content="center">
    <v-col
      v-for="(item, index) in diagnosisData"
      :key="index"
      cols="12"
      xs="12"
      sm="12"
      md="12"
      lg="12"
    >
      <v-card class="mx-auto my-5" light>
        <v-row justify="center">
          <v-card-title class="headline">
            {{ item.name }}
          </v-card-title>
        </v-row>
        <v-progress-linear
          color="blue"
        />
        <v-card-text>
          <div
            style="line-height: 30px; font-sixe: 20px"
          >
            {{ item.comment }}
          </div>
        </v-card-text>
        <v-row justify="center">
          <v-col
            cols="12"
            xs="3"
            sm="4"
            md="6"
            lg="6"
          >
            <v-img
              height="auto"
              :src="item.img"
            />
          </v-col>
        </v-row>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import { mapGetters } from 'vuex'
import ResultRadar from '../components/ResultsRadar'

export default {
  component: {
    ResultRadar
  },
  computed: {
    ...mapGetters(
      'diagnosis', ['diagnosisData']
    ),
    ...mapGetters(
      'results', ['results']
    ),
    ...mapGetters(
      'flavors', ['flavors']
    )
  }
}
</script>
