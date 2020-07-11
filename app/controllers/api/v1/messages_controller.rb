class Api::V1::MessagesController < ApplicationController
  before_action :set_channel, only: %i[index create]

  def index
    @messages = @channel.messages
    render json: @messages
  end

  def create
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:id])
  end
end
