class SubComment < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  has_many :likes
  validates :content, presence: true
end
