class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  has_many :sub_comments
  validates :content, presence: true

  def self.new_comment(params)
    Comment.new(content: params[:content], user_id: User.last.id, gossip_id: params[:gossip_id] )
  end
end
