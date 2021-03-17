<template>
  <v-container>
    <v-row justify="center" align-content="center">
      <v-col
        cols="12"
        xs="12"
        sm="12"
        md="12"
        lg="12"
      >
        <h1
          class="text-center"
          style="font-size: 20px"
        >
          性格診断でお酒と出会う
        </h1>
        <h1
          class="text-center"
          style="font-size: 50px"
        >
          さけぐらむ
        </h1>
      </v-col>
      <v-col
        v-for="item in items"
        :key="item.title"
        cols="12"
        xs="12"
        sm="8"
        md="4"
        lg="4"
      >
        <v-hover v-slot="{ hover }">
          <v-card
            class="mx-auto"
            light
          >
            <v-card-text style="font-family: 'Sawarabi Mincho', sans-serif;">
              <p class="text-center" style="font-size: 25px">
                {{ item.title }}
              </p>
              <v-expand-transition>
                <div
                  v-if="hover"
                  class="text-center transition-fast-in-fast-out v-card--reveal display-2"
                  style="height: 100%;"
                >
                  <hr>
                  {{ item.discription }}
                </div>
              </v-expand-transition>
              <hr>
              <v-img
                :src="item.img"
                width="100%"
                max-width="100%"
                class="white--text align-top"
                height="auto"
              />
            </v-card-text>
          </v-card>
        </v-hover>
      </v-col>
    </v-row>
    <v-row justify="center" align-content="center">
      <v-col cols="12" xs="8" sm="8" md="4" lg="4">
        <v-card-title>
          <v-btn
            class="text-center mx-auto my-10 py-5"
            light
            style="font-size: 30px"
            @click="hadleShowQuestions"
          >
            診断開始
          </v-btn>
        </v-card-title>
      </v-col>
      <transition
        name="fade"
      >
        <Question
          v-if="isVisibleQuestions"
        />
      </transition>
    </v-row>
  </v-container>
</template>

<script>
import Question from '../components/Question'

export default {
  data () {
    return {
      isVisible: '',
      isVisibleQuestions: false,
      items: [
        { title: '簡単診断!', discription: '1分で完了!', img: require('@/assets/phone.png') },
        { title: '新発見!?', discription: '日本酒 × 性格診断', img: require('@/assets/lights.png') },
        { title: '豊富な診断結果！', discription: '登録銘柄1000種類', img: require('@/assets/sake.png') }
      ]
    }
  },
  component: {
    Question
  },
  methods: {
    hadleShowQuestions () {
      this.isVisibleQuestions = !this.isVisibleQuestions
    }
  }
}
</script>

<style scoped>
h1{
font-family: 'Sawarabi Mincho', sans-serif;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
</style>
