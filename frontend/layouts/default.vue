<template>
  <v-app v-cloak>
    <div id="return-to-top" />
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
              <v-card-title class="headline blue lighten-2">
                <v-icon color="white">mdi-twitter</v-icon>
                シェア
              </v-card-title>
              <v-card-title class="headline lighten-2">
                お酒との出会いをシェアしよう！
              </v-card-title>
              <v-divider />
              <v-card-actions class="headline lighten-2">
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
      <transition name="fade">
        <v-btn fixed fab bottom right color=primary style="bottom: 100px" v-show="this.isShowUp"
        v-scroll-to="{ element: '#return-to-top', duration: 1000 }">
          <v-icon color="white">mdi-chevron-up</v-icon>
        </v-btn>
      </transition>
      <div class="push" />
    </v-main>
    <v-footer>
      <v-card class="py-2 mx-auto" color="rgba(0,0,0,0)" elevation="0">
        <v-toolbar-items>
          <v-btn
            text
            to="/updates"
          >
            更新情報
          </v-btn>
          <v-btn
            text
            href="https://forms.gle/dgoqtQycgK26jbJw8"
          >
            お問い合わせ
          </v-btn>
        </v-toolbar-items>
        <v-toolbar-items>
          <v-btn
            text
            to="/terms"
          >
            利用規約
          </v-btn>
          <v-btn
            text
            to="privacy_policy"
          >
            プライバシーポリシー
          </v-btn>
          <v-spacer />
        </v-toolbar-items>
      </v-card>
      <v-card-text class="py-3 text-center">
        ©️{{ new Date().getFullYear() }} <strong>さけぐらむ</strong>
      </v-card-text>
    </v-footer>
  </v-app>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';

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
      isShowUp: false,
      drawer: false
    };
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
  mounted () {
    window.addEventListener("scroll", this.onScreenEvent);
    window.addEventListener("resize", this.onScreenEvent);
    window.addEventListener("load", this.onScreenEvent);
    this.fetchArea( this.breweries[1] )
  }, 
  methods: {
    twitterShare () {
      if (this.brands[0] === undefined) {
        const shareURL = 'https://twitter.com/intent/tweet?text=' + 'さけぐらむで新たなお酒との出会いがありました！' + '%20%23さけぐらむ%20%23SAKEGRAM%20%23性格診断でお酒と出会う' + '&url=' + 'https://sg.sakegram.site/'
        location.href = shareURL
      } else {
        const shareURL = 'https://twitter.com/intent/tweet?text=' + `私をお酒で例えると${this.areas}、${this.breweries[0]}の${this.brands[0]}です!` + `%0a%23さけぐらむ%0a%23SAKEGRAM%0a%23性格診断でお酒と出会う%0a%23${this.areas}%0a%23${this.breweries[0]}%0a%23${this.brands[0]}%0a` + '&url=' + 'https://sg.sakegram.site/'
        location.href = shareURL
      }
    },
    onScreenEvent () {
      this.isShowUp = window.pageYOffset >= 32;
    },
    ...mapActions(
      'areas', ['fetchArea']
    ),
  }
}
</script>

<style>
[v-cloak] {
  display: none;
}
.v-footer {
  width: 100%;
  position: fixed;
  bottom: 0;
}
.push {
  height: 150px;
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
