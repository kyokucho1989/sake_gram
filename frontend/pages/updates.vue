<template>
  <div>
  <h1 class="text-center">更新情報</h1>
    <v-container>
      <v-row dense>
        <v-col
          v-for="(item, i) in reverseItems"
          :key="i"
          cols="12"
        >
          <v-card>
            <v-card-title class="headline">
              {{ item.title }}
            </v-card-title>
            <v-card-title>
              {{ item.description }}
            </v-card-title>
            <v-card-actions>
              <v-btn text>
                {{ item.date }}
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
  export default {
    data: () => ({
      items: [
        {
          title: 'さけぐらむβ版をリリース🍶',
          description: 'さけぐらむβ版をリリースしました',
          date: '2021/3/16',
        },
        {
          title: 'さけぐらむをリリース🎉',
          description: 'さけぐらむをリリースしました。性格診断から始まる、新しいお酒との出会いをお楽しみください！',
          date: '2021/3/17',
        },
      ],
    }),
    computed: {
    reverseItems() {
        return this.items.slice().reverse();
      },
    },
  }
</script>