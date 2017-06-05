class PhonesChannel < ApplicationCable::Channel
  def follow
    stream_from "phones_data"
  end
end
