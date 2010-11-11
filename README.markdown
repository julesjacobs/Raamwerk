Raamwerk
========

A toy proof of concept Ruby framework based on continuations. 

Usage:
    gem install sinatra
    ruby arcchallenge.rb
    
The solution to the arc challenge:

    page '/' do
      form do
        msg = input()
        submit do
          link("Click me"){ puts "You said #{msg}" }
        end
      end
    end

As you can see you can use normal lexically scoped variables for inputs. This is an improvement over Arc which does not provide an abstraction over form input, you have to use string keys into request parameters to get form input.

A counter with links to increase and decrease the count:

    def counter(i)
      puts "the counter is #{i}"
      link("increase") { counter(i+1) }
      link("decrease") { counter(i-1) }
    end

    page '/' do
      counter(0)
    end

A todolist application looks like this:

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

This displays a list of todo items with delete links, and a form to add an item.