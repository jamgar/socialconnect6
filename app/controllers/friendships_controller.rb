class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ update destroy ]

  def index
    @users = User.all # Note: this will need to be remove and place a search feature for users
    
    @friendships = current_user.friendships
    @inverse_friendships = current_user.inverse_friendships
  end

  # create the friendship request
  def create
    @user = User.find(params[:user_id])
    @friendship = current_user.friendships.build(friend_id: @user.id, confirmed: false)

    if @friendship.save
      flash[:notice] = "Friendship request sent"
    else
      flash[:alert] = "Friendship request not sent"
    end

    redirect_to friendships_path
  end

  # set the confirmed friendship
  def update
    if @friendship.update(confirmed: true, friended_at: Time.now)
      flash[:notice] = "Friendship created"
    else
      flash[:alert] = "Friendship not create"
    end

    redirect_to friendships_path
  end

  # delete friendship
  def destroy
    @friendship.destroy
    redirect_to friendships_path, notice: "Friendship removed"
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end
end