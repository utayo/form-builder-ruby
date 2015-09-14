module LD
  require "uri"
  require "set"
  require "ld/form/option_managable"
  require "ld/form/rdf/factory.rb"
  require "ld/form/serializable"
  require "ld/form/checkbox.rb"

  class Form
    include OptionManagable
    include Serializable

    def initialize(title)
      @title = title
      @items = []
      @options = Set.new
      @url = nil
      @options_base_url = nil
      @items_base_url = nil
    end
    
    def url=(url)
      url = URI.parse(url) unless url.is_a?(URI)
      @url = url
      @options_base_url = create_url_from(@url, "/options")
      @items_base_url = create_url_from(@url, "/items")
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

    def option(new_option)
      new_option = LD::Form::Option.new(new_option) if new_option.is_a?(String)
      super(new_option)
      new_option.url = create_url_from(@options_base_url, "/#{@options.length}") unless new_option.url
    end

    def checkbox(&block)
      product = LD::Form::Checkbox.new(self)
      @items.push(product)
      product.url = create_url_from(@items_base_url, "/#{@items.length}")
      product.instance_eval(&block)
      return product
    end

    def to_h
      hash = super
      hash[:title] = @title 
      hash[:options] = @options.map{|i|
        i.to_h
      }
      hash[:items] = @items.map{|i|
        i.to_h
      }
      return hash
    end

    def to_rdf(force=false)
      return @factory.graph if @factory && !force

      @factory = LD::Form::RDF::Factory.new
      @factory.add_resource(self.to_h)
      return @factory.graph
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
