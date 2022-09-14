class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.create!(message_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :user_id) 
    end
  
end