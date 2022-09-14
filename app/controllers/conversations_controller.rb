class ConversationsController < ApplicationController
  before_action :set_friends, only: %i[ index show ]

  # ActionController::Parameters.action_on_unpermitted_parameters = :false

  def index
    @conversation = Conversation.new
  end
  
  def create
    @recipient = User.find(params[:recipient_id])
    @conversation = Conversation.get(current_user.id, @recipient)
    
    if @conversation.nil?
      @conversation = Conversation.new(recipient_id: @recipient.id)  
      # @conversation = Conversation.new(conversation_params)  
      @conversation.sender = current_user
      @conversation.save
    end
    respond_to do |format|
      format.turbo_stream
    end

  end
  

  private
    def set_friends
      @friendships = current_user.friendships
      @inverse_friendships = current_user.inverse_friendships
    end

    # def conversation_params
    #   params.permit(:sender_id, :recipient_id)
    # end
end