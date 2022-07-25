class WorksChannel < ApplicationCable::Channel
  def subscribed
    stream_from "works_#{params[:workId]}"
  end

  def unsubscribed
    stop_all_streams
  end
end
