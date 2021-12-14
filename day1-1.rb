a=File.open("input1-1.txt").lines.map(&:to_i)
a.each {|x| y=2020-x;  next unless a.include?(y); puts x*y,y; break}

=begin
a.each do |x|
  y=2020-x
  (a-[x]).each do |z|
    b=y-z
    next unless a.include?(b)
    pp x,z,b
    pp x*z*b
    exit
  end
end
=end

b=a.sort

len=a.length
(0...len).each do |x|
  (x...len).each do |y|
    if b[x] + b[y] > 2020
      break
    else
      (y...len).each do |z|
        c=b[x]+b[y]+b[z]
        if c==2020
          pp b[x],b[y],b[z]
          pp b[x]*b[y]*b[z]
          exit
        elsif c > 2020
          break
        else
        end
      end
    end
  end
end 






