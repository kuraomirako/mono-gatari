class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && !is_deleted
  end

  def inactive_message
    !is_deleted ? super : :deleted_account
  end

  has_many :stories
  has_many :comments
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :reactions, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_stories, through: :bookmarks, source: :story

  validates :nickname, presence: true, length: { maximum: 15 }
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, allow_blank: true }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, allow_blank: true }
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]{6,}\z/i }, if: -> { password.present? }
end
