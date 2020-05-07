class Tag < ApplicationRecord
  has_many :tag_gossips
  has_many :gossips, through: :tag_gossips
  validates :title, presence: true
end
