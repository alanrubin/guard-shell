require 'guard'
require 'guard/guard'
 
module Guard
  class Shell < Guard
    autoload :Notifier, 'guard/shell/notifier'
    VERSION = '0.1.1'
    
    def initialize(watchers = [], options = {})
      super

      options[:notify] = true if options[:notify].nil?
    end
    
    # Print the result of the command, if there is a result
    # to be printed. (see README.md)
    #
    # @param res [Array] the result of the commands that have run
    #
    def run_on_change(command)
      UI.info "Running shell command: #{command}", :reset => true
      
      start_at = Time.now
      
      @result = system(command[0])
      
      Notifier::notify(@result, command[0], Time.now - start_at) if notify?
    end
    
    def notify?
      !!options[:notify]
    end 

  end
end