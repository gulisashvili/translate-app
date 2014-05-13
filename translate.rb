require "yaml"
require_relative "translate_api"


module YamlHelper
  FILE = "data/data.yaml"
  
  class FileRedactor
    include TranslateApi
    
    def write_to_file(data)
      File.open FILE, "a+" do |file|
        file.write data.to_yaml
      end
    end

    def read_file
      file = File.read FILE
      result = YAML.load file
      result || []
    end
    
    def add_new_word(word)
      data = []
      file_data = read_file

      puts file_data
      
      translate = Translator.new
      result = translate.get_data word
      data.push(result)
      write_to_file data
    end 
  
  end


a = FileRedactor.new

a.add_new_word("girl")



end

