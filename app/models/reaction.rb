class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :kind, presence: true, inclusion: { in: %w(涙 驚 笑 手) }
end