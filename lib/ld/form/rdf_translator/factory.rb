module LD
  class Form
    require "rdf"
    require "uri"
    require "ld/form/rdf/vocabulary"
    
    module RDFTranslator
      class Factory
        include Vocabulary
        attr_reader :graph

        def initialize(graph=nil)
          @graph = graph || ::RDF::Graph.new
        end

        def add_resource(item)
          item = item.to_h if item.is_a?(LD::Form::Serializable)
          to_triples(item) if is_resource?(item)
          return @graph
        end

        alias :product :graph

        private 
        def is_resource?(item)
          return item.is_a?(Hash) && item[:url] != nil
        end

        def to_triples(item)
          about = ::RDF::Resource.new(item[:url])
          statements = []
          item.each{|key, value|
            property = self.lookup(key)

            value = self.to_triples(value)[:about] if value.is_a?(Hash)
            value = ::RDF::Resource.new(value) if value.is_a?(URI)
            p value
            statements << ::RDF::Statement.new(about, property, value) if property != nil && value != nil
            @graph << statements[statements.length - 1] if statements.length > 0
          }
          return {
            about: about,
            statements: statements
          }
        end
        
      end

    end
  end
  
end
