module LD
  class Form

    class Item
      attr_reader :parent

      def initialize(form, title=nil)
        @parent = form
        @title = title
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
