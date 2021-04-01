<template>
  <div>
    <v-row justify="center" align-content="center">
      <v-col
        v-for="question in questions"
        :key="question.title"
        cols="12"
        xs="12"
        sm="12"
        md="12"
        lg="12"
      >
        <v-card class="mx-auto my-5">
          <v-card-title class="headline">
            Q{{ question.title }}.
            {{ question.discription }}
          </v-card-title>
          <hr>
          <v-col cols="12" xs="12" sm="12" md="12" lg="12">
            <v-card-title>
              <p>あてはまる</p>
              <v-spacer />
              <p>あてはまらない</p>
            </v-card-title>
            <v-layout justify-center>
              <v-card-title :id="'q-'+question.title">
                <v-btn
                  class="mx-1"
                  fab
                  light
                  :ripple="{ center: false, class: 'gray--text' }"
                  @click="countAnswer(question.title,5)"
                  v-on:click="clickScroll"
                >
                  5
                </v-btn>
                <v-btn
                  class="mx-1"
                  fab
                  light
                  small
                  :ripple="{ center: false, class: 'gray--text' }"
                  @click="countAnswer(question.title,4)"
                  v-on:click="clickScroll"
                >
                  4
                </v-btn>
                <v-btn
                  class="mx-1"
                  fab
                  light
                  small
                  :ripple="{ center: false, class: 'gray--text' }"
                  @click="countAnswer(question.title,3)"
                  v-on:click="clickScroll"
                >
                  3
                </v-btn>
                <v-btn
                  class="mx-1"
                  fab
                  light
                  small
                  :ripple="{ center: false, class: 'gray--text' }"
                  @click="countAnswer(question.title,2)"
                  v-on:click="clickScroll"
                >
                  2
                </v-btn>
                <v-btn
                  class="mx-1"
                  fab
                  light
                  :ripple="{ center: false, class: 'gray--text' }"
                  @click="countAnswer(question.title,1)"
                  v-on:click="clickScroll"
                >
                  1
                </v-btn>
              </v-card-title>
            </v-layout>
          </v-col>
          <hr>
          <p
            class="text-center mx-auto py-3"
            style="font-size: 26px"
          >
            あなたの回答：{{ question.answer }}
          </p>
        </v-card>
      </v-col>
    <v-dialog
      v-model="dialog"
      width="500"
    >
      <template #activator="{ on, attrs }">
      <v-col cols="4" xs="4" sm="2" md="2" lg="1">
        <v-btn
          style="font-size: 30px"
          x-large
          :disabled="isVisible"
          :ripple="{ center: false, class: 'gray--text' }"
          @click="startDiagnosis"
          v-bind="attrs"
          v-on="on"
        >
          診断
        </v-btn>
      </v-col>
      </template>
      <v-card
        elevation="2"
        light
        loading
      >
        <v-card-title class="headline lighten-2">
          診断中．．．
        </v-card-title>
        <v-card>
        <v-img
          :src="require('@/assets/kaiseki.png')"
          height="400px"
        ></v-img>
        </v-card>
      </v-card>
    </v-dialog>
    </v-row>
    <p
      v-if="isVisible"
      class="text-center red--text text--lightn-3 my-5"
    >
      未回答の項目があります。
    </p>
  </div>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  data () {
    return {
      isVisible: '',
      items: [
        { title: '簡単診断!', discription: '質問はたった10問', img: require('@/assets/phone.png') },
        { title: '新発見!?', discription: '日本酒 × 性格診断', img: require('@/assets/lights.png') },
        { title: '豊富な診断結果！', discription: '登録銘柄1000種類以上', img: require('@/assets/sake.png') }
      ],
      msgs: [],
      dialog: false
    }
  },
  computed: {
    ...mapGetters(
      'questions', ['questions']
    ),
    ...mapGetters(
      'results', ['results']
    ),
    ...mapGetters(
      'diagnosis', ['diagnosisData']
    ),
    ...mapGetters(
      'sakeData', ['brandId']
    ),
    ...mapGetters(
      'brands', ['brands']
    ),
    ...mapGetters(
      'breweries', ['breweries']
    )
  },
  watch: {
    brandId: {
      immediate: true,
      handler (val) {
        this.fetchBrand(val)
      }
    },
    brands: {
      immediate: true,
      handler (val) {
        this.fetchBrewery(val[1])
      }
    },
    breweries: {
      immediate: true,
      handler (val) {
        this.fetchArea(val[1])
      }
    }
  },
  mounted () {
    const notAnswers = this.questions.filter(question => question.answer === '未回答')
    if (notAnswers.length > 0) {
      this.isVisible = true
    } else {
      this.isVisible = false
    }
  },
  updated () {
    const notAnswers = this.questions.filter(question => question.answer === '未回答')
    if (notAnswers.length > 0) {
      this.isVisible = true
    } else {
      this.isVisible = false
    }
  },
  methods: {
    ...mapMutations(
      'questions', ['updateAnswer']
    ),
    ...mapMutations(
      'results', ['addResult']
    ),
    ...mapMutations(
      'diagnosis', ['addDiagnosis']
    ),
    ...mapMutations(
      'flavors', ['addFlavors']
    ),
    ...mapActions(
      'sakeData', ['createSakeData']
    ),
    ...mapActions(
      'brands', ['fetchBrand']
    ),
    ...mapActions(
      'breweries', ['fetchBrewery']
    ),
    ...mapActions(
      'areas', ['fetchArea']
    ),
    countAnswer (indexNum, pt) {
      this.updateAnswer({ indexNum, pt })
    },
    async startDiagnosis () {
      const targetArray = this.questions
      const result1 = targetArray[0].answer + 5 - targetArray[5].answer //外向性
      const result2 = targetArray[1].answer + 5 - targetArray[6].answer //情緒安定性
      const result3 = targetArray[2].answer + 5 - targetArray[7].answer //開放性
      const result4 = targetArray[3].answer + 5 - targetArray[8].answer //誠実性
      const result5 = targetArray[4].answer + 5 - targetArray[9].answer //調和性
      const result = [result1, result2, result3, result4, result5]
      const flavor = [result1 / 9, result5 / 9, result4 / 9, result2 / 9, (10 - result5) / 9, result3 / 9]
      const sakeFlavor = flavor.join(',')
      this.addFlavors(flavor)
      this.addResult(result)
      try {
        await this.createSakeData(sakeFlavor)
        for (let i = 1; i <= 5; i++) {
          if (result[i - 1] <= 3) {
            this.getResult(3 * i - 2)
          } else if (result[i - 1] <= 6) {
            this.getResult(3 * i - 1)
          } else if (result[i - 1] <= 9) {
            this.getResult(3 * i)
          }
        }
        await this.fetchBrand(this.brandId)
        setTimeout(
        this.$router.push('/result'),
        3000)
      } catch (error) {
        alert('データの取得に失敗しました')
        this.dialog = false
      }
    },
    getResult (resKey) {
      this.$axios.$get(`/api/v1/results/${resKey}`).then(res => this.addDiagnosis(res))
    },
    getFlavor () {
      this.$axios.$get('api/v1/flavors').then(res => this.addFlavors(res))
    },
    clickScroll (e) {
      const targetRect = e.currentTarget.getBoundingClientRect()
      window.scrollTo(0, window.pageYOffset + targetRect.top)
    }
  }
}

</script>

<style scoped>
h1{
font-family: 'Sawarabi Mincho', sans-serif;
}
</style>
