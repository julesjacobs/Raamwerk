def capture
  t,$stdout = $stdout,StringIO.new
  yield
  t,$stdout = $stdout,t
  t.string
end

def tag(name, attrs={})
  puts "<#{name}#{attrs.map{|k,v| " #{k}='#{v}'"}.join}>#{capture{yield}}</#{name}>"
end

def link(text)
  url = '/' + rand(36**9).to_s(36)
  page(url){yield}
  tag(:a, :href => url){puts text}
end

def form
  content = capture{yield}
  tag(:form, :action => $formurl, :method => :post){puts content}
end

def submit
  $formurl = '/' + rand(36**9).to_s(36)
  page($formurl){yield}
  tag(:input, :type => :submit){}
end

$inputs = Hash.new{|h,k| h[k] = ""}

def input
  id = rand(36**9).to_s(36)
  tag(:input, :name => id){}
  $inputs[id]
end

def page(s)
  get(s){ capture{yield} }
  post(s){ 
    params.each{|(k,v)| $inputs[k].replace(v) }
    capture{yield} 
  }
end