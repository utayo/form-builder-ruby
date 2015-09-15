module LD
  require "uri"
  require "set"
  require "ld/form/option_managable"
  require "ld/form/serializable"
  require "ld/form/rdf_serializable"
  require "ld/form/item"
  require "ld/form/checkbox.rb"

  class Form
    include OptionManagable
    include Serializable
    include RDFSerializable

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
      self.add_item(product)
      product.instance_eval(&block)
      return product
    end

    def add_item(item)
      @items.push(item) if item.is_a?(LD::Form::Item)
      item.url = create_url_from(@items_base_url, "/#{@items.length}") unless item.url
    end

    def in_items?(item)
      return @items.include?(item)
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

    def to_rdf
      graph = super
      about = RDF::Resource.new(@url)

      graph << [about, RDF::Vocab::DC.title, @title]
      graph << [about, RDF.type, RDFFactory::Vocabulary::Form.type]
      graph << [about, RDF::Vocabularry::Form.options, to_rdf_as_bag(graph, options)]
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
