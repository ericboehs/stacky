class CommandsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "commands_#{current_user.id}"
  end
end
