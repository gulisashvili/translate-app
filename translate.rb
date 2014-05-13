require "yaml"
require_relative "translate_api"


module YamlHelper
  FILE = "data/data.yaml"
  
  class FileRedactor
    include TranslateApi
    
    def write_to_file(data)
      File.open FILE, "w+" do |file|
        file.write data.to_yaml
      end
    end

    def read_file
      file = File.read FILE
      result = YAML::load file
    end
    
    def add_new_word(word)
      tr = Translator.new
      result = tr.get_data word

      write_to_file result
    end

  end


a = FileRedactor.new

puts a.add_new_word("tennis")
 
puts a.read_file

end

