module LD
  class Form
    require "ld/form/item"
    
    class NumberField < Item

      def initialize
        @answer_type = Fixnum
        @min_value = 0
        @max_value = 10
      end

      def min_number(number=nil)
        min_number=(number) if number
        return @min_number
      end

      def min_number=(number)
        @min_number = normalize_value(number) if is_valid_number?(number)
      end

      def max_number(lenth=nil)
        min_number=(number) if number
        return @max_number
      end

      def max_number=(number)
        @max_number = normalize_value(number) if is_valid_number?(number) && is_greater_than_min_number?(number)
      end      

      protected
      def is_valid_number?(number)
        return number.is_a?(Fixnum)
      end

      def is_greater_that_min_number?(number)
        return @min_number == nil || @min_number <= number
      end

      def allow_integer_only?
        return @answer_type == Fixnum
      end

      def allow_float?
        return @answer_type == Float
      end

      def normalize_value(number)
        return number.floor if allow_integer_only?
        return number
      end

    end

  end
end

