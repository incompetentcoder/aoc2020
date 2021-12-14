a=File.open("input13.txt").read.split("\n")
t=a[0].to_i
pp (a[1].split(",").delete_if{|x| x=="x"}.map{|x| [x.to_i - t.modulo(x.to_i),x.to_i]}.sort)[0].reduce(:*)

hm=a[1].split(",").each_with_index.map{|x,y| [x.to_i,y] if x!="x"}.compact.sort.reverse

arr=100000.times.map {|x| hm[0][0]*x - hm[0][1]} & 1000000.times.map {|x| hm[1][0]*x - hm[1][1]} & 1000000.times.map {|x| hm[2][0]*x - hm[2][1]}
diff=arr[2]-arr[1]
offset=arr[0]

arf=[]
ind=1
shit=1
while shit==1 do
  ind+=1
  shit=0
  arf=diff*ind+offset
  hm[3..-1].each do |x|
    if (arf + x[1]).modulo(x[0]) == 0
      next
    else
      shit=1
      break
    end
  end
  pp ind if ind%100000000==0
end
pp arf






