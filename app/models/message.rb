class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :content, presence: true


  # broadcast message
  after_create_commit -> { broadcast_append_to "messages_#{self.conversation.id}", partial: "messages/message", locals: { message: self }, target: "messages_#{self.conversation.id}"}
end
