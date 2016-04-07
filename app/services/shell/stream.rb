require 'open3'

class Shell::Stream
  attr_reader :user_id, :node_id

  def initialize user_id, node_id
    @user_id = user_id
    @node_id = node_id
  end

  def run command
    Open3.popen2e(command) do |stdin, stdout_and_stderr, thread|
      while line = stdout_and_stderr.gets
        publish line
      end
    end
  end

  private

  def publish line
    ActionCable.server.broadcast "commands_#{user_id}", { node_id: node_id, line: line }
  end
end
