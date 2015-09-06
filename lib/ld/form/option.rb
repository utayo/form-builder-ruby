module LD
  class Form
    require "uri"    

    class Option
      
      attr_reader :label, :parents
      
      def initialize(label, url=nil)
        @label = label
        @parents = []
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
        @parents.push(item) unless @parents.index(item)
      end
      
    end
  end
end
      
