class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      # redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
      head :ok
    else
      render "chatrooms/show"
    end
  end

  def message_params
    params.require(:message).permit(:content, :photo, :video)
  end
end
