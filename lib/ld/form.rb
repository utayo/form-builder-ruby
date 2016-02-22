module LD
  require "uri"

  class Form

    def initialize(title)
      @title = title
      @items = []
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
      def create(&block)
        product =  self.new(nil)
        product.instance_eval(&block)
        return product
      end
    end

  end

end
