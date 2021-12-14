a=File.open("input9.txt").lines.map(&:to_i)
eep=0
(25..a.length).each do |x|
  eep=x
  (b=a[(x-25)..(x-1)]).each do |y|
    if b.include?(a[x] - y) && a[x]!=y*2
      eep=1
      break
    end
  end
  if eep == x
    pp a[x]
    break
  end
end

inv=a[eep]
a.length.times do |x|
  sum = 0
  len = 0
  while sum < inv do
    len+=1
    sum+=a[x+len]
  end
  if sum == inv
    pp a[x..x+len].minmax.sum
    break
  end
end
    




