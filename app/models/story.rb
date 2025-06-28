class Story < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :genre
  before_validation :set_default_draft

  validates :title, :body, presence: true
  validates :body, length: { minimum: 300, message: "は300文字以上入力してください" }

  validates :category_id, :genre_id, numericality: { other_than: 1, message: "can't be blank"}


  private

  def set_default_draft
    self.draft = false if draft.nil?
  end
end