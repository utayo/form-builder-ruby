module LD
  class Form
    require "ld/form/item"
    require "ld/form/option"
    require "ld/form/option_managable"
    require "set"
    
    class Checkbox < Item
      include OptionManagable

      def initialize(form, title=nil)
        super(form, title)
        @options = Set.new
      end

      alias :choices :options
      alias :choice :option
    end
  end
end
    
