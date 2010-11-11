require 'sinatra'
require './raamwerk.rb'

$todo = []

def todo
  tag(:ul) do
    $todo.each do |x| 
      tag(:li){puts x; link("delete"){ $todo.delete(x); todo }}
    end
  end
  
  form do
    t = input()
    submit { $todo << t; todo }
  end
end

page '/' do
  todo
end