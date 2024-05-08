class Film < ApplicationRecord
    has_many :comments, dependent: :destroy
  
    validates :duration, presence: true, numericality: { greater_than: 0 }
    validates :description, presence: true, length: { minimum: 10, message: "must be at least 10 characters long" }
  end