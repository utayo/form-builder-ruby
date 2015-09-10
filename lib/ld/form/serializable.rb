module LD
  class Form
    require "json"
    module Serializable

      def to_h
        return {
          class: self.class.to_s
        }
      end

      def to_json
        return self.to_h.to_json
      end
    end
  end
end
