# encoding: utf-8

require_relative "file_redactor"

module CommandHelper

  class CommandController

    include FileHelper

    def get_translate_result(word)
      result = FileRedactor.new
      result.add_new_word(word)
    end

    def command_play
      puts "შეიყვანეთ სათარგმნი სიტყვა"
      answer = gets.chomp.to_s

      puts "---- SUCCESS ----"
      puts "---- #{answer} ----"
      puts "---- LOADING ---- "
      
      puts get_translate_result(answer)
      
      puts "---- FINISHED ---- "
    end

  end

end
