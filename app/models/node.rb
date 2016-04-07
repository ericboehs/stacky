class Node < ActiveRecord::Base
  after_save :queue_docker_create
  after_destroy :queue_docker_rm

  validates :name, presence: true, format: { with: /\A[0-9a-zA-Z_-]+\z/ }

  def size
    "2gb"
  end

  private

  def queue_docker_create
    args = {
      command: 'create',
      driver: '-d digitalocean',
      driver_key: "--digitalocean-access-token #{ENV.fetch('DIGITAL_OCEAN_ACCESS_TOKEN')}",
      driver_size: "--digitalocean-size #{size}",
      node_name: name
    }

    ShellStreamJob.perform_later(
      user_id, id,
      "docker-machine #{args.values.join ' '}"
    )
  end

  def queue_docker_rm
    args = {
      command: 'rm',
      force: '-f',
      node_name: name
    }

    ShellStreamJob.perform_later(
      user_id, id,
      "docker-machine #{args.values.join ' '}"
    )
  end
end
