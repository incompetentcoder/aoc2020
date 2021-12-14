a=File.open("input8.txt").read.split("\n").map{|x| [x.split(" ")[0][0],x.split(" ")[1].to_i]}
acc=0
ind=0
inds=[]
while inds[ind] == nil
  inds[ind]=1
  case a[ind][0]
  when "a"
    acc+=a[ind][1]
    ind+=1
  when "j"
    ind+=a[ind][1]
  when "n"
    ind+=1
  end
end
pp acc

a.each_index do |hh|
  case a[hh][0]
  when "j"
    a[hh][0] = "n"
  when "n"
    a[hh][0] = "j"
  else
    next
  end
  acc=0
  ind=0
  inds=[]
  while inds[ind] == nil
    if ind == a.length
      pp acc
      exit
    end
    inds[ind]=1
    case a[ind][0][0]
    when "a"
      acc+=a[ind][1]
      ind+=1
    when "j"
      ind+=a[ind][1]
    when "n"
      ind+=1
    end
  end
  a[hh][0] == "j" ? a[hh][0] = "n" : a[hh][0] = "j"
end

