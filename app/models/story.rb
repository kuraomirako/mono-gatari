class Story < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :genre
  has_many :comments
  has_many :reactions, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarking_users, through: :bookmarks, source: :user

  validates :title, :body, presence: true
  validates :body, length: { minimum: 300, message: "は300文字以上入力してください" }

  validates :category_id, :genre_id, numericality: { other_than: 1, message: "を選択してください"}

end