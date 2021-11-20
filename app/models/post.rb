class Post < ApplicationRecord
  validates :title, presence: true
  validates :keywords, presence: true
end
