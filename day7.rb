require 'set'
require 'pry'
a=File.open("input7.txt").read.split("\n")
b=Hash.new
a.each do |x|
  y=x.split(" bags contain ")
  b[y[0].to_sym] = y[1].scan(/\d+.(\w+.\w+)/).flatten.map{|x| x.to_sym}
end

outer=b.select {|x,y| y.include?("shiny gold".to_sym)}.keys
inc=true
while inc == true do
  inc=false
  s = outer.size
  outer.each do |z|
    outer+=(b.select {|x,y| y.include?(z)}.keys) - outer
  end
  inc=true if outer.size > s
end

pp outer.size

def rec(a,b,c)
  $tot+=c*(a[0])
  b[a[1]].each do |x|
    rec(x,b,c*(a[0]))
  end
end

a.each do |x|
  y=x.split(" bags contain ")
  b[y[0].to_sym] = y[1].scan(/(\d+).(\w+.\w+)/).map{|x| [x[0].to_i,x[1].to_sym]}
end

$tot=0
b["shiny gold".to_sym].each do |x|
  rec(x,b,1)
end

pp $tot

  

