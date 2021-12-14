a=File.open("input2.txt").read.lines.map{|x| x.chomp.delete(":").split}
cor=0
a.each do |x|
  b=x[0].split("-").map(&:to_i)
  cor+=1 if Range.new(b[0],b[1]).include?(x[2].count(x[1]))
end

pp cor

cor=0
a.each do |x|
  b=x[0].split("-").map {|i| i.to_i() -1}
  z=x[2].chars
  cor+=1 if ((z[b[0]]==x[1] ? 1 : 0) + (z[b[1]]==x[1] ? 1 : 0)) == 1
end

pp cor



