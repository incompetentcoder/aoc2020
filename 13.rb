a=File.open("input13.txt").read.split("\n")

hm=a[1].split(",").each_with_index.map{|x,y| [x.to_i,y] if x!="x"}.compact.sort.reverse


(100000..10000000000).each_slice(10000000) do |i|
  pp i[-1]
  st1=i.map {|x| hm[0][0]*x - hm[0][1]}
  hm.each do |y|
    st2=i.map {|x| y[0]*x - y[1]}
    st1=st1 & st2
    if st1 != []
      next
    else
      break
    end
  end
end
pp st1

