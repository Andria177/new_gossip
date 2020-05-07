module LikesHelper

def user_liked?(gossip)
  gossip.likes.each do |like|
    if like.user == current_user
      return false
    end
  end
end

def find_like(gossip)
  gossip.likes.each do |like|
    if like.user == current_user
      return like.id
    end
  end
end

end
