class ShellStreamJob < ActiveJob::Base
  def perform(user_id, node_id, command)
    Shell::Stream.new(user_id, node_id).run command
  end
end
