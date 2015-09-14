module LD
  class Form
    require "rdf"
    require "uri"
    require "ld/form/rdf/vocabulary"
    
    class RDFTranslator
      attr_reader :graph

      def initialize(grpah=nil)
        @graph = graph || RDF::Graph.new
        @strategies = {
          LD::Form => LD::Form::RDFTranslator::Form.translator,
          LD::Form::Option => LD::Form::RDFTranslator::Option.translator,
          LD::Form::Checkbox => LD::Form::RDFTranslator::Checkbox.translator
        }
      end

      def to_rdf(target)
        strategy = @strategies[traget.class]
        @graph << strategy.call(self, target)
        return @graph
      end

    end
end
