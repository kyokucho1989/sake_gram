<template>
  <v-app v-cloak>
    <v-app-bar
      :clipped-left="clipped"
      fixed
      app
    >
      <v-btn
        text
        to="/"
        style="font-size: 30px;font-family: 'Sawarabi Mincho', sans-serif;"
      >
        さけぐらむ
      </v-btn>
      <v-spacer />
      <v-switch v-model="theme" :prepend-icon="themeIcon" />
    </v-app-bar>
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
    <v-footer>
      <v-card-text class="py-2 text-center">
        <v-toolbar-items>
          <v-spacer />
          <v-btn
            text
            to="/terms"
          >
            利用規約
          </v-btn>
          <v-spacer />
          <v-btn
            text
            to="privacy_policy"
          >
            プライバシーポリシー
          </v-btn>
          <v-spacer />
        </v-toolbar-items>
      </v-card-text>
      <v-card-text class="py-3 text-center">
        ©️{{ new Date().getFullYear() }} <strong>さけぐらむ</strong>
      </v-card-text>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      clipped: false,
      fixed: false,
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'SAKEGRAM',
      icons: [
        'mdi-twitter'
      ],
      theme: false
    }
  },
  computed: {
    themeIcon () {
      return this.theme ? 'mdi-bottle-wine-outline' : 'mdi-bottle-wine'
    }
  },
  watch: {
    theme () {
      this.$vuetify.theme.dark = this.theme
    }
  }
}
</script>

<style>
/* コンパイルされていない変数を隠す設定 */
[v-cloak] {
  display: none;
}
</style>
