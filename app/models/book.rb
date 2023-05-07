class Book < ApplicationRecord
  # both title and body are required
  validates :title, presence: true
  validates :body, presence: true
end
