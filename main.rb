# encoding: utf-8
require_relative "translate_api"


tr = TranslateApi::Translator.new

puts "შეიყვანეთ სათარგმნი სიტყვა"

word = gets.chomp

puts tr.get_data(word)
