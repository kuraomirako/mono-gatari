class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stories
  has_many :comments
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :reactions, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_stories, through: :bookmarks, source: :story

  validates :nickname, presence: true,
                       length: { minimum: 1, maximum: 15, message: "1~15文字以内で設定してください" }
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: '日本語を全角で入力してください' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: '日本語を全角で入力してください' }
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]{6,}\z/i, message: '半角英数字を両方を含めて、6文字以上で設定してください' }
end
