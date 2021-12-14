a=File.open("input14.txt").read.split("\n")
mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
mem={}
a.each do |x|
  case x[0..1]
  when "ma"
    mask=x.scan(/\w+/)[1]
  when "me"
    addr,val = x.scan(/\d+/).map(&:to_i)
    val = val.to_s(2).rjust(36,"0")
    mem[addr] = 36.times.map {|y| mask[y]=="X" ? val[y] : mask[y]}.join
  end
end
pp mem.values.map {|x| x.to_i(2)}.reduce(:+)


mask="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
masks=[]
mem={}
mask2=0
ind=[]
cnt=0
a.each do |x|
  case x[0..1]
  when "ma"
    masks=[]
    mask=x.scan(/\w+/)[1]
    mask2=mask.tr("X","0").to_i(2)
    ind=mask.chars.each_index.select{|x| mask[x]=="X"}
    cnt=mask.count("X")
 #   ["0","1"].repeated_permutation(mask.count("X")).each do |z|
 #     mask2=mask.clone
 #     z.each do |zz|
 #       mask2.sub!("X",zz)
 #     end
 #     masks.push(mask2.to_i(2))
  when "me"
    addr,val = x.scan(/\d+/).map(&:to_i)
    addr2=(mask2 | addr).to_s(2).rjust(36,"0")
    ["0","1"].repeated_permutation(cnt).each do |z|
      addr3=addr2.clone
      cnt.times do |zz|
        addr3[ind[zz]]=z[zz]
      end
      mem[addr3.to_i(2)]=val
    end
  end
end
pp mem.values.reduce(:+)


