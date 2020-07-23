class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :decks
  has_one_attached :photo
end
