<template>
  <v-card>
    <v-row align-content="center">
      <v-col
        v-for="(item, index) in diagnosisData"
        :key="index"
        cols="12"
        xs="4"
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
              xs="4"
              sm="4"
              md="4"
              lg="4"
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
  </v-card>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  computed: {
    ...mapGetters(
      'diagnosis', ['diagnosisData'],
    ),
    ...mapGetters(
      'results', ['results'],
    ),
    ...mapGetters(
      'flavors', ['flavors'],
    ),
  },
};
</script>
