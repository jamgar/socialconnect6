module FriendshipHelper
  # Friend Requests - Friendships we requested
  def pending_friend_requests
    @friendships.map { |friendship| friendship unless friendship.confirmed }.compact
  end

  # Friendship Requested - Friendships others requested
  def pending_friendship_requested
    @inverse_friendships.map { |friendship| friendship unless friendship.confirmed }.compact
  end

  def friend?(user)
    friends = @friendships.map { |friendship| friendship.friend.id if friendship.confirmed }.compact
    friends += @inverse_friendships.map { |friendship| friendship.user.id if friendship.confirmed }.compact
    friends.include?(user.id)
  end

  def friend(friendship) 
    friendship.user.id == current_user.id ? friendship.friend : friendship.user
  end

  def confirmed_friendships
    friends = @friendships.map { |friendship| friendship if friendship.confirmed }.compact
    friends += @inverse_friendships.map { |friendship| friendship if friendship.confirmed }.compact
  end

  def friend_or_pending?(user)
    pending = pending_friend_requests.map { |f| f.friend.id }
    pending += pending_friendship_requested.map { |f| f.user.id }
    if friend?(user) || pending.include?(user.id)
      return true
    end
    return false
  end
end