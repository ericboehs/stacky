# monkey patch ActiveRecord to avoid There are n other session(s) using the database.
module ActiveRecord
  module Tasks # :nodoc:
    module DatabaseTasks
      extend self

      def configuration
        @arguments.first
      end

      def pg_adapter
        class_for_adapter(configuration['adapter']).new(*@arguments)
      end

      def terminate_existing_connetions
        pg_adapter.establish_connection(*@arguments)
        pg_adapter.connection.select_all("select * from pg_stat_activity order by pid;").each do |x|
          if configuration['database'] == x['datname'] && x['state'] == "idle"
            pg_adapter.connection.execute("select pg_terminate_backend(#{x['pid']})")
          end
        end
      end

      def drop(*arguments)
        @arguments = arguments
        terminate_existing_connetions
        pg_adapter.drop
      rescue Exception => error
      end
    end
  end
end
