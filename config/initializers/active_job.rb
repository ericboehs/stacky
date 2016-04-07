ActiveJob::Base.queue_adapter = :que

Que.logger.level = :info
Que.mode = :off
