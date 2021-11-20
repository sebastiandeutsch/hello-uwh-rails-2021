class Post < ApplicationRecord
  validates :title, presence: true
  validates :keywords, presence: true

  has_many :comments
end
