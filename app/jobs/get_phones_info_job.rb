class GetPhonesInfoJob < ApplicationJob

  def perform phones_resource, keyword, channel
    parser = "#{phones_resource}_parser".classify.constantize.new keyword
    dimentions = parser.get_dimentions

    publish channel, dimentions
  end

  private

  def publish channel, message
    ActionCable.server.broadcast(
      'phones_data',
      channel: channel,
      message: ApplicationController.render(
        partial: 'phones/phone_data',
        locals: { message: message }
      )
    )
  end
end
