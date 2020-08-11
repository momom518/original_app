README

<h1>TOKUBAI</h1>

<h2>アプリケーション概要</h2>
<p>このアプリを利用しているスーパーの「当日のタイムセール情報」を見ることができます。</p>
<h2>デプロイ先URL</h2>
https://original-27042.herokuapp.com/
<h2>アカウント</h2>
  <h4>●管理者ユーザー スーパーAAA管理者●</h4>
    <p>
    email: admin@example.com<br>
    password: 111aaa
    </p>
  <h4>●管理者ユーザー Bスーパー管理者●</h4>
    <p>
      email: admin2@example.com<br>
      password: 111aaa
    </p>
  <h4>●一般ユーザー taro●</h4>
    <p>
    email: taro@example.com<br>
    password: 111aaa
    </p>
  ＊emaiは半角英数、パスワードは半角で入力してください。
<h2>制作背景(意図)</h2>
<p>私が勤務しているスーパーではタイムセールをやっているのですが、日付や時間を間違えて来店されるお客様が多くいらっしゃいます。中には、「チラシが見にくくて、何がタイムセールの情報なのかよくわからない」と仰る方もいます。チラシが見られるアプリはありますが、様々な店のセール情報を閲覧できるアプリはあまり見たことがなかったので、今回作成してみました。</p>

<h1>工夫したポイント</h1>
<h4>●今日のセール情報のみ表示●</h4>
<p>ユーザーが日付と時刻を間違って来店することを防ぐために、当日の情報だけを表示するようにし、さらにセールの開始時間と終了時間を一目でわかるようにビューを実装しました。ローカル環境、heroku環境ともに、日本時間に合わせています。</p>
<h4>●一般ユーザーと管理者ユーザーを区別して、できることを制限●</h4>
<>pスーパーのスタッフ側と客側が利用することを前提に実装しました。一般のユーザーがセール情報などを投稿できてしまうと、情報の信頼性を担保することができないためです。<br>
管理者は自身の管理するスーパーの店舗情報を新規登録、編集、削除できます。加えて、自身が管理している店のセール情報の登録、削除ができます。自身が管理している店舗以外については、閲覧のみできるようにしました。（例えば、Bスーパー管理者のページでは、自身の管理している店ではないスーパーAAAのチラシに削除ボタンが現れません。Bスーパーのセール情報のみに現れます。）<br>
これに対して、一般ユーザーはセール情報と店舗情報の閲覧のみできるようにしました。</p>
なお、管理者ユーザーの作成が自由にできてしまうと、情報の信頼性を担保できないため、今回はユーザーの新規登録ページから登録できるのは一般ユーザーだけにしています。<br>
<h4>●店舗情報をブックマーク●</h4>
<p>今日のセール情報一覧には、アプリに登録してある店舗の当日のセール情報がすべて表示されるようになっていますが、ユーザーが見る情報は普段利用している店のセール情報が多いと考えられるため、一般ユーザーは特定の店の情報をブックマークできるように実装しました。セール情報詳細をクリックするとその店の当日のセール情報をみられます。ブックマーク登録した時と解除した時はフラッシュメッセージが表示されます。</p>
ユーザーインターフェースを考えて、ブックマークボタン、削除ボタンは店舗詳細ページなどではなく、ブックマーク店舗一覧ページに設置しました。<br>
ほかに、同じ店舗は一度しかブックマークできないように、ユーザーIDとショップIDの組み合わせについてユニーク制約をかけています。<br>

<h1>今後実装したい機能</h1>
<h4>●明日のセール情報欄を追加●</h4>
<p>日付間違いを防ぐために、今日のセール情報だけを表示しているが、別ページに翌日のセール情報だけをまとめたものを表示できるようにした方が、翌日の情報もわかりユーザーのニーズにより答えられると思ったためです。</p>
<h4>●検索機能●</h4>
<p>商品名でセール情報を検索できる方がより、ユーザーにとって使いやすいため。</p>
<h4>●管理者の権限レベルを追加●</h4>
<p>管理者レベルを考慮して、それに応じてできることを制限したいと思いました。具体的には、セール情報の操作は権限の低い人間でも行えるが、店情報を操作できるのはより上位の権限を持っている者だけが行えるようにしたいです。これは、より現実に近づけるためです。セール情報を投稿するのはおそらく責任者ではなく、一般のスタッフであると考えられ、頻繁に投稿・削除される可能性が高いので、権限の低い人間にも行えるようにしたいと考えました。反対に、店の情報は頻繁にかわるものではなく簡単に変更できないようにした方が情報の信頼性を担保できると考えられるためです。</p>
<h4>●AWSへのデプロイ●<h4>
<p>herokuでは画像が一定時間経過により削除されてしまうので、せっかくの画像が消えてしまうと購買意欲にも影響が出ると考えたためです。</p>

# データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|admin|boolean|default:false|
### Association
- has_many :sales
- has_many :bookmarks, dependent: :destroy
- has_many :bookmark_shops, through: :bookmarks, source: :shop

## salesテーブル
|Column|Type|Options|
|------|----|-------|
|shop_id|reference|foreign_key: true|
|department_id|integer|null:false|
|headig|text|null:false|
|info|text|null:false|
|caution|text| null:false|
|day|date|null:false|
|start_time|time|null:false|
|end_time|time|null:false|
### association
- has_one_attached :image
- belongs_to :shop
- belongs_to_active_hash :department

### shopテーブル
|Column|Type|Options|
|------|----|-------|
|company_name|string|null:false|
|shop_name|string|null:false|
|postal_code|string|null:false|
|prefecture_id|integer|null: false|
|address|string|null: false|
|start_time|time |null: false|
|end_time|time|null: false|
|tell|string|null: false,length:maximum:11|
|user_id|reference|foreign_key: true|
### association
has_one_attached :image
- belongs_to :user
- has_many :sales, dependent: :destroy
- has_many :bookmark, dependent: :destroy
- belongs_to_active_hash :prefecture

## bookmarkテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|shop_id|reference|foreign_key: true|
### association
- belongs_to :user
- belongs_to :shop

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
