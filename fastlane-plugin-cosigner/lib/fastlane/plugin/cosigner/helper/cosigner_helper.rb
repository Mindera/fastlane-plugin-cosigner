module Fastlane
  module Helper
    class CosignerHelper
      # class methods that you define here become available in your action
      # as `Helper::CosignerHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the cosigner plugin helper!")
      end
    end
  end
end
