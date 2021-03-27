import Vue from 'vue' // vueのインポート
import VueScrollTo from 'vue-scrollto'　// 先ほどインストールしたライブラリをインポート

// ライブラリの登録＋オプション
Vue.use(VueScrollTo, {
  duration: 7000,
  easing: [0, 0, 0.1, 1],
  offset: -100
})
