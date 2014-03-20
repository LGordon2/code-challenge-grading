class Challenge < ActiveRecord::Base
  has_many :submissions
  
  validates :month, presence: true
  validates :year, presence: true
  validates :league, presence: true, inclusion: {in: %w(bronze silver gold)}
end
