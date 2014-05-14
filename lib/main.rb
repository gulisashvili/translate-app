# encoding: utf-8

require_relative "command_controller.rb"

class Runner

  include CommandHelper

  def self.start
    start = CommandController.new
    start.command_play
  end

end


Runner.start
