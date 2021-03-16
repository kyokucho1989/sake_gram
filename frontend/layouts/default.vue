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
        <div>
          <v-dialog
            v-model="dialog"
            width="500"
          >
            <template #activator="{ on, attrs }">
              <v-btn
                fixed
                fab
                bottom
                color="#BDBDBD88"
                style="bottom: 100px"
                v-bind="attrs"
                v-on="on"
              >
                <v-icon color="white">mdi-share-variant</v-icon>
              </v-btn>
            </template>
            <v-card>
              <v-card-title class="headline grey lighten-2">
                <v-icon>mdi-twitter</v-icon>
                シェア
              </v-card-title>
              <v-card-title>
                Twitterでおさけとの出会いをシェアしよう！
              </v-card-title>
              <v-divider />
              <v-card-actions class="headline white lighten-2">
                <v-spacer />
                <v-btn
                  color="primary"
                  text
                  @click="twitterShare"
                >
                  Tweet
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </div>
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
import { mapGetters } from 'vuex';

export default {
  data() {
    return {
      clipped: false,
      fixed: false,
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'SAKEGRAM',
      icons: [
        'mdi-twitter',
      ],
      theme: false,
      dialog: false,
    };
  },
  computed: {
    ...mapGetters(
      'brands', ['brands'],
    ),
    themeIcon() {
      return this.theme ? 'mdi-bottle-wine-outline' : 'mdi-bottle-wine';
    }
  },
  watch: {
    theme () {
      this.$vuetify.theme.dark = this.theme
    }
  },
  methods: {
    twitterShare () {
      if (this.brands[0] === undefined) {
        const shareURL = 'https://twitter.com/intent/tweet?text=' + 'さけぐらむで新たなお酒との出会いがありました！' + '%20%23さけぐらむ%20%23SAKEGRAM%20%23性格診断でお酒と出会う' + '&url=' + 'https://sg.sakegram.site/'
        location.href = shareURL
      } else {
        const shareURL = 'https://twitter.com/intent/tweet?text=' + `私をお酒で例えると${this.brands[0]}でした` + '%20%23さけぐらむ%20%23SAKEGRAM%20%23性格診断でお酒と出会う' + '&url=' + 'https://sg.sakegram.site/'
        location.href = shareURL
      }
    }
  }
}
</script>

<style>
/* コンパイルされていない変数を隠す設定 */
[v-cloak] {
  display: none;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
