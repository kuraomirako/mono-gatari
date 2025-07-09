# アプリケーション名
---
者-モノ-語り　（モノガタリ）

# アプリケーション概要
---
物語を投稿できる・読める　長文専門のプラットフォーム

# URL
---
https://mono-gatari.onrender.com

# テスト用アカウント
---
・Basic認証ID：kuraomirako
・Basic認証パスワード：7700
・メールアドレス：ac.test@example.com
・パスワード：test000

# 利用方法
---
### 物語投稿
---
......................................................................................
《　会員登録の特権　》
- 『コメントの送信/積読機能(ブックマーク)の利用/フォロー機能/マイページ作成』が利用可能

- 会員登録は、ヘッダーの「会員登録」ボタンから可能

......................................................................................

《　物語投稿の仕方　》
- ヘッダーの「投稿する」ボタンから、「カテゴリー/ジャンル/タイトル/本文」を入力すると投稿ができる


- 物語を読むだけなら会員登録不要

......................................................................................

# アプリケーションを作成した背景
---
投稿者・読者 それぞれににテーマがあります。

◀︎ 投稿者 ▶︎
『自分の経験談』『知り合いに話すほどではない、取り止めのない話しだが、カタチとして残しておきたい』を叶える

◀︎ 読 者 ▶︎
『活字が好き』　『人の話しを聞くのは好きだが、実際会うまでには至らない』　『身近にいる人では聞ける話が限られる』を叶える

端末の中とはいえ、落ち着ける場所、ふとした時に着たくなる場所を作りたいと思いました。

今は、パッとつぶやけるアプリやブログ、小説投稿アプリなど... 類似アプリはたくさんあると思います。
その中でこのアプリケーションの立ち位置は、"物語投稿を目的とした長文専門"のプラットフォームを目指しました。


# 実装予定の機能
---
下書き保存機能、検索機能、退会機能　を実装予定

# データベース設計
---


# 開発環境
---
・フレームワーク：Ruby On Rails
・言語：Ruby、JavaScript、HTML、CSS
・データベース：MySQL(開発環境)、PostgreSQL(本番環境)
・開発ツール：VSCode、GitHub、Render
・テスト：RSpec、FactoryBot


# 工夫したポイント
---
- 長文専門のため、300文字未満は投稿できないように設定
- 落ち着ける場所の雰囲気作りのため、フォロー数/フォロワー数は、自分自身しか見れないように設定
---


#### ◇　users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| birthday           | date   | null: false |

#### ⇆　association
has_many :stories
has_many :comments
has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
has_many :following, through: :active_relationships, source: :followed
has_many :followers, through: :passive_relationships, source: :follower
has_many :reactions, dependent: :destroy
has_many :bookmarks, dependent: :destroy
has_many :bookmarked_stories, through: :bookmarks, source: :story

......................................................................................

#### ◇　stories テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| title       | string  | null: false |
| body        | text    | null: false |
| category_id | integer | null: false |
| genre_id    | integer | null: false |

#### ⇆　association
belongs_to :user
belongs_to_active_hash :category
belongs_to_active_hash :genre
has_many :comments
has_many :reactions, dependent: :destroy
has_many :bookmarks, dependent: :destroy
has_many :bookmarking_users, through: :bookmarks, source: :user

......................................................................................





......................................................................................


......................................................................................

......................................................................................

......................................................................................

......................................................................................
