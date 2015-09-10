module LD
  class Form
    require "uri"    
    require "set"
    require "ld/form/item"
    require "ld/form/serializable"

    class Option
      include Serializable
      
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

      def to_h
        hash = super
        hash[:label] = @label
        hash[:refered_from] = {
          type: @parents.class.to_s,
          items: @parents.map{|p| p.url}
        }
        return hash
      end        
      
    end
  end
end
      
