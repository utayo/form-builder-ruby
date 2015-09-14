module LD
  module Form
    require "rdf"
    class RDFFactory
      attr_reader :graph

      def initialize(graph=nil)
        @graph = graph || RDF::Graph.new
      end

      def add_resource(item)
        item = item.to_h if item.is_a?(LD::Form::Serializable)
        self.create_triples(item, graph) if(self.is_resource?(item))
        return graph
      end

      alias :product, :graph

      private 
      def is_resource?(item)
        return item.is_a?(Hash) && item[:url] != nil
      end
      
      def create_triple_from(item, graph)
        about = RDF::Resource.new(item[:url])
      end
      
    end

  end
end
    
