module LD
  class Form
    module RDF
      require "rdf"
      
      module Vocabulary

        TABLE = {
          title: ::RDF::DC.title
        }

        def lookup(attribute)
          p TABLE[attribute]
          return TABLE[attribute]
        end
        
      end
    end
  end
end
