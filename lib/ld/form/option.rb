module LD
  class Form
    require "uri"    

    class Option
      
      attr_reader :label
      
      def initialize(label, url=nil)
        @label = label
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
      
    end
  end
end
      
