<template>
  <v-container
    style="max-width: 1030px;
    margin: 0 auto;"
  >
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
        cols="12"
        xs="12"
        sm="8"
        md="4"
        lg="4"
      >
      <h1
        class="text-center"
        style="font-size: 20px"
      >
        メンテナンス中につき、
      </h1>
      <h1
        class="text-center"
        style="font-size: 20px"
      >
        再開まで、
      </h1>
      <h1
        class="text-center"
        style="font-size: 20px"
      >
        しばらくお待ちください。
      </h1>
      <v-img
        :src="require('@/assets/syazai.png')"
        width="100%"
        max-width="100%"
        class="white--text align-top"
        height="auto"
      />
      </v-col>
    </v-row>
  </v-container>
</template>