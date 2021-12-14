a=File.open("input11.txt").chars.to_a
len=a.index("\n")+1
lent=a.length
a=a+["\n"]+["\n"]*len
changed=true
z=[-len-1,-len,-len+1,-1,+1,+len-1,+len,+len+1]

while changed
  changed=false
  b={}
  lent.times do |x|
    case a[x]
    when "L"
      sur=0
      z.each do |zz|
        if a[x+zz] == "#"
          sur+=1
          break
        end
      end
      b[x]="#" if sur == 0 
    when "#"
      sur=0
      z.each do |zz|
        if a[x+zz] == "#"
          sur+=1
          if sur == 4
            b[x]="L"
            break
          end
        end
      end
    end
  end
  if b != {}
    changed=true
    b.each_pair {|k,v| a[k]=v}
  end
end
pp a.count("#")


a=File.open("input11.txt").chars.to_a
len=a.index("\n")+1
lent=a.length
a=a+["\n"]+["\n"]*len
changed=true
z=[-len-1,-len,-len+1,-1,+1,+len-1,+len,+len+1]

while changed
  changed=false
  b={}
  lent.times do |x|
    case a[x]
    when "L"
      sur=0
      z.each do |zz|
        mal=1
        while a[x+zz*mal] == "."
          mal+=1
        end
        if (a[x+zz*mal]) == "#"
          sur+=1
          break
        end
      end
      b[x]="#" if sur == 0
    when "#"
      sur=0
      z.each do |zz|
        mal=1
        while a[x+zz*mal] == "."
          mal+=1
        end
        sur+=1 if (a[x+zz*mal]) == "#"
        if sur == 5
          b[x]="L"
          break
        end
      end
    end
  end
  if b != {}
    changed=true
    b.each_pair {|k,v| a[k]=v}
  end
end
pp a.count("#")



