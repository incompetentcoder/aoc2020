a=File.open("input15.txt").read.split(",").map(&:to_i)
order=a.clone
numh=order.each_with_index.map{|x,y| [x,[y]]}.to_h
while order.length < 30000000 do
  last=order[-1]
  cur=0
  if numh[last]
    if numh[last].size > 1
      cur=numh[last][-1] - numh[last][-2]
    end
  end
  numh[cur] ? numh[cur].append(order.length) : numh[cur]=[order.length]
  order.append(cur)
end

pp order[-1]


