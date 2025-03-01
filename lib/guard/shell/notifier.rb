# encoding: utf-8
module Guard
  class Shell
    class Notifier

      def self.guard_message(command, duration)
        "#{command}\nin %.1f seconds." % [duration]
      end

      # failed | success
      def self.guard_image(result)
        icon = if result
          :success
        else
          :failed
        end
      end

      def self.notify(result, command, duration)
        message = guard_message(command, duration)
        image   = guard_image(result)

        ::Guard::Notifier.notify(message, :title => 'Shell command', :image => image)
      end

    end
  end
end
