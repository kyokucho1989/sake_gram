import colors from 'vuetify/es5/util/colors'

const config = {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    titleTemplate: '%s',
    title: 'さけぐらむ',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '性格診断でお酒と出会う' },
      { hid: 'og:site_name', property: 'og:site_name', content: 'さけぐらむ' },
      { hid: 'og:type', property: 'og:type', content: 'website' },
      { hid: 'og:url', property: 'og:url', content: 'https://sg.sakegram.site' },
      { hid: 'og:title', property: 'og:title', content: 'さけぐらむ' },
      { hid: 'og:description', property: 'og:description', content: '性格診断でお酒と出会う' },
      { hid: 'og:image', property: 'og:image', content: 'https://sg.sakegram.site/sakegram.png' },
      { hid: 'twitter:card', name: 'twitter:card', content: 'summary_large_image' },
      { hid: 'twitter:site', name: 'twitter:site', content: '@watsumi_'},
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/fabicon.ico' },
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    { src: '@/plugins/vue-scrollto', ssr: false },
    { src: '@/plugins/vue-chartjs', ssr: false },
    { src: '@/plugins/persistedState.client', ssr: false }
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
    // https://go.nuxtjs.dev/vuetify
    '@nuxtjs/vuetify',
    '@nuxtjs/google-analytics'
  ],
  googleAnalytics: {
    id: process.env.GOOGLE_ANALYTICS_ID
  },

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    '@nuxtjs/proxy',
    'nuxt-logrocket',
    'nuxt-webfontloader'
  ],

  logRocket: {
    logRocketId: 'hxjkjq/sakegramlog',
    devModeAllowed: false,
  },

  webfontloader: {
    google:{
      families: ['Sawarabi+Mincho']
    }
  },

  proxy: {
    '/api': {
      target: 'https://backend.sg.sakegram.site',
//      target: 'http://localhost:5000',
//      target: 'http://172.20.0.1:5000',
      pathRewrite: {
        '^/api': '/api'
      }
    }
  },
  // Axios module configuration: https://go.nuxtjs.dev/config-axios

  publicRuntimeConfig: {
    axios: {
      baseURL: 'https://backend.sg.sakegram.site'
    },
    googleAnalytics: {
      id: process.env.GOOGLE_ANALYTICS_ID
    }
  },

  // Vuetify module configuration: https://go.nuxtjs.dev/config-vuetify
  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3
        }
      }
    }
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  },

  generate: {
    dir: '../backend/public'
  },

  server: {
    port: 3000,
    host: '0.0.0.0'
  }
}

export default config
