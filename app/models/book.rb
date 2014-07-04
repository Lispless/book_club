class Book < ActiveRecord::Base
  has_many :reviews
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :year, presence: true,
    numericality: { greater_than_or_equal_to: 1041, less_than: 2014 }
end
