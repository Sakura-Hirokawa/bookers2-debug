class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])
    if UserRoom.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      current_user.chats.create(chat_params)
      @chats = room.chats
      # @message = Chat.create(params.require(:chat).permit(:user_id, :message, :room_id).merge(user_id: current_user.id))
    else
      redirect_back(fallback_location: root_path)
      # redirect_to "/chats/#{@chat.room_id}"
    end
  end

  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.chats
      @message = Chat.new
      @entries = @room.user_rooms
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:message).merge(room_id: params[:room_id])
  end
  
end
