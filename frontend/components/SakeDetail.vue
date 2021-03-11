<template>
  <v-card class="mx-auto my-auto px-auto py-auto">
    <v-row justify="center">
      <v-card-title class="headline">
        銘柄：{{ brands[0] }}
        <br />
        蔵元：{{ breweries[0] }}
        <br />
        地域：{{ areas }}
      </v-card-title>
    </v-row>
    <div class="text-right">
      <a href="https://sakenowa.com">さけのわデータ</a>を利用しています。
    </div>
  </v-card>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  data () {
    return {
      vhtml: ''
    }
  },
  computed: {
    ...mapGetters(
      'brands', ['brands']
    ),
    ...mapGetters(
      'breweries', ['breweries']
    ),
    ...mapGetters(
      'areas', ['areas']
    )
  }
}
</script>

<style scoped>
.rader-chart {
  width: 400px;
  max-height: 300px;
}
</style>
