require "net/http"
require "json"

module TranslateApi
  
  class Translator    
    def get_data(word)
      uri = URI("http://translate.ge/Main/Translate?text=#{word}&lang=en&")
      res = Net::HTTP.get_response(uri)
      res = JSON.parse(res.body)
      data = { res[0]["ReqText"] => res[0]["Text"]}
    end 
  
  end 


# a = Translator.new

# puts a.get_data("boy")

end
