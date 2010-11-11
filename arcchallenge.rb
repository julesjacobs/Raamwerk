require 'sinatra'
require './raamwerk.rb'

page '/' do
  form do
    msg = input()
    submit do
      link("Click me"){ puts "You said #{msg}" }
    end
  end
end