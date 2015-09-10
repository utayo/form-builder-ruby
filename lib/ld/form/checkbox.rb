module LD
  class Form
    require "ld/form/item"
    require "ld/form/option"
    require "set"
    
    class Checkbox < Item

      def initialize(form, title=nil)
        super(form, title)
        @options = Set.new
      end

      def options(new_options=nil)
        new_options = [new_options] unless  new_options.is_a?(Array) || new_options.is_a?(Set)
        new_options.each{|i|
          self.option(i)
        }
        return @options
      end

      def option(new_option=nil)
        new_option = LD::Form::Option.new(new_option) if new_option.is_a?(String)
        
        if new_option.is_a?(LD::Form::Option)
          @options.add(new_option)
          new_option.add_parent(self)
        end
        return @options
      end

      alias :choices :options
      alias :choice :option
    end
  end
end
    
