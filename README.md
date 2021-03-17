![sakegram](https://user-images.githubusercontent.com/67275879/111465358-5a380700-8765-11eb-9551-d1bcaa53a6b0.png)

<hr>
<p align="center">
  <a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/67275879/111465621-ad11be80-8765-11eb-8bbe-78c29bedd912.png" height="45px;" /></a>
  <a href="https://www.ruby-lang.org/ja/"><img src="https://user-images.githubusercontent.com/67275879/111465579-a125fc80-8765-11eb-9622-f8ad5d3ca205.png" height="45px;" /></a>
  <a href="https://ja.nuxtjs.org/"><img src="https://user-images.githubusercontent.com/67275879/111466541-c5cea400-8766-11eb-9762-6f15a7be2b9a.png" height="45px;" /></a>
  <a href="https://www.docker.com/"><img src="https://user-images.githubusercontent.com/67275879/111466739-01696e00-8767-11eb-8932-4c1d6b89ca2f.png" height="40px;" /></a>
  <a href="https://aws.amazon.com/jp/"><img src="https://user-images.githubusercontent.com/67275879/111468131-9325ab00-8768-11eb-84eb-6b2b65734f0e.png" height="45px;" /></a>
  <a href="https://muro.sakenowa.com/sakenowa-data/"><img src="https://user-images.githubusercontent.com/67275879/111482073-e69ef580-8776-11eb-8dd3-232a8bd306bb.png" height="45px;" /></a>
</p>

<hr>

## 📲 App URL

### **https://sg.sakegram.site**  


## 🍶さけぐらむ概要
さけぐらむは、性格診断結果からユーザにあった日本酒をレコメンドするサービスです。

### 課題
- 昨今の国内日本酒市場は減少傾向にある
- 日本酒はブランド化され、アジア諸国への輸出量が増加している
- 日本人の日本酒離れが進んでいる

### 解決方法
- 普段馴染みのない日本酒との接点を生み出すサービス


## 使用方法
<table>
  <tr>
    <th></th>
    <th>イメージ</th>
    <th>説明</th>
  </tr>
  <tr>
    <td>トップページ</td>    
    <td><img src="https://user-images.githubusercontent.com/67275879/111495708-fd4b4980-8782-11eb-86be-8811d0f72f67.png"></td>
    <td>サービスの概要が視覚的に伝わるようになっています。<br>「診断開始」ボタンを押下すると、質問項目が表示されます。</td>    
  </tr>
  <tr>
    <td>質問事項</td> 
    <td><img src="https://user-images.githubusercontent.com/67275879/111498025-f02f5a00-8784-11eb-8d6f-c711bce0cb53.png"></td>
    <td>質問項目は５段階で回答する形式になっています。<br>右下に表示されるFABを押すことで、いつでもページのトップに戻れます。</td>    
  </tr>
  <tr>
    <td>診断中</td> 
    <td><img src="https://user-images.githubusercontent.com/67275879/111499774-a2b3ec80-8786-11eb-98dc-7929b6a11811.png"></td>
    <td>すべての質問事項に回答後、「診断」ボタンを押下できるようになります。<br>診断結果ページに遷移するまで、診断中のダイアログが表示されます。</td>    
  </tr>
  <tr>
    <td>診断結果</td> 
    <td><img src="https://user-images.githubusercontent.com/67275879/111500853-c75c9400-8787-11eb-8367-52730cc9876b.png"></td>
    <td>診断結果を元におすすめの銘柄が表示されます。<br>また、診断結果のレーダーチャートが生成されます。</td>    
  </tr>
   <tr>
    <td>シェア</td> 
    <td><img src="https://user-images.githubusercontent.com/67275879/111503073-c3ca0c80-8789-11eb-9d83-211a4c0075e2.png"></td>
    <td>左下のFABを押下することで、診断結果をTwitterでシェアするためのダイアログが表示されます。</td>    
  </tr>
</table>


## :gear:使用技術
- Ruby on Rails 6.0.3
- Nuxt.js 2.14.12
- Doker for Mac 3.2.1
- AWS(ECR, ECS, Fargate) 
- さけのわデータAPI

### :gem:主なgem
- rack-cors（CORS）
- active_hash（診断結果を定義）
- annoy-rb（近似最近傍探索で銘柄を取得）

### :open_file_folder:主なモジュール
- vue-scrollto（ページトップに移動）
- vue-chartjs（レーダーチャートの作成）
- vuetify-dialog（ダイアログ表示）
- vuex-persistedstate（VuexのステートをWebストレージに保存）


## インフラ構成図
![sakegram](https://user-images.githubusercontent.com/67275879/111503647-43f07200-878a-11eb-84e1-7fcbf415c699.png)

## :green_book:関連記事
### Qiita
#### [【個人開発】性格診断でお酒と出会う新サービス、「さけぐらむ🍶」リリースしました！🎉🎉](https://qiita.com/watsumi_/items/cd77a0f2ec3630d550f8)
 
### ブログ
#### [【Nuxt】DockerでNuxt.jsを導入する際にハマったことまとめ](https://bon-voyage23.hatenablog.com/entry/2021/03/11/234039)
#### [DockerでNuxt.jsからRailsAPIを叩いたら「[HPM] Error occurred while trying to proxy request」にハマった話](https://bon-voyage23.hatenablog.com/entry/2021/03/13/230549)
#### [【Nuxt.js】と【Rails】を連携させて【AWS】でデプロイするときのハマりポイントまとめ](https://bon-voyage23.hatenablog.com/entry/2021/03/16/081025)
