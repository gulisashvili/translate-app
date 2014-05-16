# encoding: utf-8

require "yaml"
require_relative "translate_api"

module FileHelper
  
  FILE = "../data/data.yaml"
  
  class FileRedactor
    
    include TranslateApi
    
    def write_to_file(data)
      File.open FILE, "a+" do |file|
        file.write(data.to_yaml)
      end
    end

    def read_file
      file = File.read(FILE)
      result = YAML.load_stream(file) || []
    end

    def save_translated_to_file(word)
      translate = Translator.new
      translate.get_data(word) do |data|
        write_to_file(data)
        data
      end
    end

    def match_check(word, matched)
      if matched
        puts "already Exists"
      else
        save_translated_to_file(word)
      end
    end
    
    def add_new_word(word)
      file_data = read_file
      result ||= {} 
      matched = false
      
      file_data.each do |data|
        if data.has_key?(word) 
          matched = true
          data.each { |key, val| result = data[word] }
          return result
        end
      end

      result = match_check(word, matched)[word]
    end 
  
  end

end
