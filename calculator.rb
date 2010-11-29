require 'sinatra'
require './raamwerk.rb'

def calc(stack)
  tag(:p){ puts stack }
  %w{+ - * /}.each do |op|
    link(op){ calc([stack[0].send(op, stack[1])] + stack[2..-1]) }
  end
  10.times{|n| link(n){ calc([n] + stack) } }
end

page '/' do
  calc([])
end