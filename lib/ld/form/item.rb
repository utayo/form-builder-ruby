module LD
  class Form
    require "ld/form/serializable"
    require "ld/form/rdf_serializable"
    
    class Item
      include Serializable
      include RDFSerializable
      attr_reader :parent

      def initialize(form, title=nil)
        @parent = form
        @title = title
        @parent.add_item(self) unless @parent.in_items?(self)
      end

      def url=(url)
        url = URI.parse(url) unless url.is_a?(URI)
        @url = url
      end
      
      def url(url=nil)
        self.url=(url) if url
        return @url 
      end
      
      def title=(title)
        @title = title
      end
      
      def title(title=nil)
        self.title = title if title
        return @title
      end

      class << self
        def create(form, &block)
          product =  self.new(form, nil)
          product.instance_eval(&block)
          return product
        end
      end  
      
    end

  end
end
