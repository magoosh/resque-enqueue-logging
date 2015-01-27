# This plugin adds a hook to log information about the job after it's enqueued
#
# Example:
#
#   Resque.enqueue SortUserJob, 1, :force => true
#
#   > development.log
#   Enqueued SortUserJob to "low": user_id=1, options={"force"=>true}
#

module Resque
  module Plugins
    module EnqueueLogging
      def after_enqueue_logging(*args)
        coded_args = Resque.decode(Resque.encode(args))
        
        human_args = coded_args.zip(method(:perform).parameters).map do |arg, param|
          # parameter signatures are tuples like [:req, :user_id]
          "#{param ? param.last : "?"}=#{arg.inspect}"
        end

        queue = Resque.queue_from_class(self)

        Resque.logger.info "Enqueued #{self} to \"#{queue}\": #{human_args.join(", ")}"
      end
    end
  end
end
