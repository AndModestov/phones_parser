class PhonesController < ApplicationController
  before_action :set_channel, only: :index

  def index
  end

  def get_info
    phones_resource = params[:phones_resource]
    keyword = params[:keyword]
    channel = params[:channel]

    GetPhonesInfoJob.perform_later phones_resource, keyword, channel

    publish channel
  end

  private

  def publish channel
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
