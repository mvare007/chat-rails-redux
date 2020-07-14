class Api::V1::MessagesController < ApplicationController
  before_action :set_channel, only: %i[index create]

  def index
    @channels = Channel.all
    messages = @channel.messages.order(:created_at)
    render json: messages
  end

  def create
    message = @channel.messages.build(content: params[:content])
    message.user = current_user
    message.author = current_user.nickname
    message.save
    render json: message
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
