module LD
  class Form
    require "uri"    
    require "set"
    require "ld/form/item"

    class Option
      
      attr_reader :label, :parents
      
      def initialize(label, url=nil)
        @label = label
        @parents = Set.new
        self.url = url
      end

      def url=(url)
        url = URI.parse(url) if url && !url.is_a?(URI)
        @url = url
      end

      def url(url=nil)
        self.url= url if url
        return @url
      end

      def add_parent(item)
        if item.is_a?(LD::Form::Item)
          @parents.add(item)
          item.parent.options(self) if item.parent
        end
      end
      
    end
  end
end
      
