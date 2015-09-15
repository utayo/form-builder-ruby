module LD
  class Form
    class RDFTranslator
      require "rdf"
      module Vocabulary
        class Form
          @@type  = RDF::Resource.new(BASE + "form")
          @@refered_from = @@type + "#has_options"
          
          class << self
            def type
              return @@type
            end
            def options
              return @@refered_from
            end
          end

        end
      end
    end
  end
end
