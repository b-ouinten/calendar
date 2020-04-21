require 'time'
require 'bundler'
Bundler.require

require_relative 'lib/user'
require_relative 'lib/event'

class App
  event = Event.new('2020-04-21 09:00', 30, 'Prepare guidelines', [['oouahiba@yahoo.fr', 55], ['ouinten_abdel@yahoo.fr'], ['aseba@yahoo.fr', 26]])
  puts event.is_past?
  puts event.in_future?
  puts event.is_soon?
  event.to_s
  binding.pry
end

App.new