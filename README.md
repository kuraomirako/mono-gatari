# アプリケーション名
---
者-モノ-語り　（モノガタリ）
<br>

# アプリケーション概要
---
物語を投稿する、読む　長文専門のプラットフォーム
<br>

# URL
---
https://mono-gatari.onrender.com
<br>

# テスト用アカウント
---
・Basic認証ID：kuraomirako
・Basic認証パスワード：7700
・メールアドレス：ac.test@example.com
・パスワード：test000
<br>

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
<br>

# アプリケーションを作成した背景
---
投稿者・読者 それぞれににテーマがあります。

◀︎ 投稿者 ▶︎
「自分の経験談、小さい頃の記憶、知り合いに話すほどではない話、取り止めのない話」。でも『カタチとして残しておきたい』を叶える

◀︎ 読 者 ▶︎
『体験談を聞くのが好き、リアルに足を運べない、身近にいる人では聞ける話しが限られる』を解消する

端末の中とはいえ、落ち着ける場所、ふとした時に着たくなる場所を作りたいと思いました。

今は、パッとつぶやけるアプリやブログ、小説投稿アプリなど… 類似アプリはたくさんあると思います。
その中で『その 人物＝者 のお話しをメインとした』“長文専門”のアプリケーションを目指しました。


# 実装予定の機能
---
下書き保存機能、検索機能、退会機能　を実装予定
<br>

# データベース設計
---

<br>

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
- 落ち着ける空間作りのため、フォロー数/フォロワー数は、自分自身しか見れないように設定
<br>

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
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| body        | text       | null: false                    |
| category_id | integer    | null: false                    |
| genre_id    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


#### ⇆　association
belongs_to :user
belongs_to_active_hash :category
belongs_to_active_hash :genre
has_many :comments
has_many :reactions, dependent: :destroy
has_many :bookmarks, dependent: :destroy
has_many :bookmarking_users, through: :bookmarks, source: :user

......................................................................................

#### ◇　comments テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| comment_box | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| story       | references | null: false, foreign_key: true |

#### ⇆　association
belongs_to :user
belongs_to :story

......................................................................................

#### ◇　relationships テーブル
| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| follower_id | integer | null: false |
| followed_id | integer | null: false |

#### ⇆　association
belongs_to :follower, class_name: "User"
belongs_to :followed, class_name: "User"

......................................................................................

#### ◇　reactions テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| story  | references | null: false, foreign_key: true |
| kind   | string     | null: false                    |

#### ⇆　association
belongs_to :user
belongs_to :story

......................................................................................

#### ◇　bookmarks テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| story  | references | null: false, foreign_key: true |

#### ⇆　association
belongs_to :user
belongs_to :story

......................................................................................

......................................................................................
