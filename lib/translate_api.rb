# encoding: utf-8

require "net/http"
require "json"

module TranslateApi
  
  class Translator    
    
    def get_data(word, &callback)
      uri = URI("http://translate.ge/Main/Translate?text=#{word}&lang=en&")
      
      res = Net::HTTP.get_response(uri)
 
      res = res.body

      res.force_encoding 'utf-8'
      res.gsub!(/\xC2\xAD/i, '')
      
      result = JSON.parse(res)
      
      data = { result[0]["ReqText"] => result[0]["Text"] }
      
      callback.call(data)
    end 
  
  end 

end
