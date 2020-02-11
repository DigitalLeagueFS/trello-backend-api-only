class Column < ApplicationRecord
  belongs_to :board
  has_many :cards, dependent: :destroy
  validates :background_color, presence: true
  belongs_to :user
end
