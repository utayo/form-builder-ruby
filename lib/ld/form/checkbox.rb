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

      def to_h
        hash = super
        hash[:title] = @title
        hash[:options] = {
          type: @options.class.to_s,
          items: @options.map{|i|
            i.url
          }
        }
        return hash
      end

      alias :choices :options
      alias :choice :option
    end
  end
end
    
