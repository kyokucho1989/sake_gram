<template>
  <v-container
    style="max-width: 1030px;
    margin: 0 auto;"
  >
  <h1 class="text-center">更新情報</h1>
    <v-container>
      <v-row dense>
        <v-col
          v-for="(item, i) in reverseItems"
          :key="i"
          cols="12"
        >
          <v-card class="my-3">
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
  </v-container>
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
        {
          title: '地域情報が取得できないエラーを修正📱',
          description: '一部のユーザーに確認された、銘柄の地域情報が取得できないエラーを修正しました。ご迷惑をおかけし、大変申し訳ありません。今後ともさけぐらむをよろしくお願いいたします。',
          date: '2021/3/17',
        },
        {
          title: '診断結果ページの表示を修正📝',
          description: '診断結果ページで日本酒銘柄の詳細情報について表示を修正しました。',
          date: '2021/3/19',
        },
        {
          title: 'Twitter投稿の内容を修正📝',
          description: 'Twitter投稿の内容に地域名及び、蔵元の名称の表示を追加しました。',
          date: '2021/3/19',
        },
        {
          title: '質問項目のスクロール動作の修正📱',
          description: '性格診断の質問項目で、ボタン以外の箇所をクリックした際にスクロールしてしまう問題を修正しました。',
          date: '2021/3/19',
        },
        {
          title: 'レイアウトを一部修正📱',
          description: '「診断開始」ボタンの表示サイズを拡大しました。ブラウザの表示サイズを変更しました。',
          date: '2021/3/28',
        },
        {
          title: 'アクセスができない状態が続いた問題について',
          description: '2021/3/28 20:00以降アクセスができない状態が発生しました。原因はサーバー側の設定に関するものであり、現在は復旧しております。利用者の皆様にはご迷惑をおかけし、大変申し訳ございません。今後とも、さけぐらむをよろしくお願いいたします。',
          date: '2021/3/28',
        },
        {
          title: 'メンテナンスの実施について',
          description: '一時、さけぐらむにアクセスできない問題が続いたため、緊急メンテナンスを実施いたしました。ご不便をおかけし、申し訳ございませんでした。',
          date: '2021/3/29',
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
