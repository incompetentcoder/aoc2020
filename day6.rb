require 'set'
pp File.open("input6.txt").read.split("\n\n").map {|x| (x.chars - ["\n"]).to_set.size}.reduce(:+)
total=[]
a=File.open("input6.txt").read.split("\n\n").each do |x|
  counts=0
  y=(x.chars - ["\n"]).to_set
  ncount=x.lines.length
  y.each {|z| counts+=1 if x.count(z) == ncount}
  total.push(counts)
end
pp total.reduce(:+)



  


