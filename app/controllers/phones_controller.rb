class PhonesController < ApplicationController
  before_action :set_channel, only: :index

  def index
  end

  def get_dimentions
    phones_resource = params[:phones_resource]
    keyword = params[:keyword]
    channel = params[:channel]

    GetPhoneDataJob.perform_later phones_resource, keyword, channel

    publish_to_channel channel
  end

  private

  def publish_to_channel channel
    ActionCable.server.broadcast(
      'phones_data',
      channel: channel,
      message: ApplicationController.render(
        partial: 'phones/phone_data',
        locals: { message: 'Search...' }
      )
    )
  end

  def set_channel
    @channel = SecureRandom.hex(5)
  end
end
