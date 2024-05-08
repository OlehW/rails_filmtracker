class Comment < ApplicationRecord
  belongs_to :film

  validates :text, presence: true, length: { minimum: 10, message: "must be at least 10 characters long" }
end