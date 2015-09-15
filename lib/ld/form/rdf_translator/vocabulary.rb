module LD
  class Form
    class RDFTranslator
      require "rdf"
      module Vocabulary
        BASE = "http://www.tom.sfc.keio.ac.jp/maff/2015/form/"
      end
    end
  end
end

require "ld/form/rdf_translator/vocabulary/option"
