class Review < ActiveRecord::Base
  belongs_to :book
  validates :rating, presence: true,
    numericality: { greater_than_or_equal_to: 0, less_than: 6 }
  validates :body, presence: true
end
