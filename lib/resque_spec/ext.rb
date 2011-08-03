require 'resque'
require 'resque/plugin'

module Resque
  class Job
    def self.create(queue, klass, *args)
      Resque.validate(klass, queue)

      #if ResqueSpec.inline?
        #constantize(klass).perform(*decode(encode(args)))
      #else
        ResqueSpec.enqueue(queue, :class => klass, :args => args)
      #end
    end

    def self.destroy(queue, klass, *args)
      ResqueSpec.dequeue(queue, :class => klass, :args => args)
    end
  end # Job
end
