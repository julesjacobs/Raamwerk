require 'sinatra'
require './raamwerk.rb'

def counter(i)
  puts "the counter is #{i}"
  link("increase") { counter(i+1) }
  link("decrease") { counter(i-1) }
end

page '/' do
  counter(0)
end