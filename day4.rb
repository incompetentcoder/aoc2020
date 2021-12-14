a=File.open("input4.txt").read.split("\n\n").map{|x| x.split(/\s/).map{|y| y.split(":")}.to_h}
req=["byr","iyr","eyr","hgt","hcl","ecl","pid"]
valid=0
a.each do |x|
  valid+=1 if req-x.keys==[]
end
pp valid

ecl=["amb","blu","brn","gry","grn","hzl","oth"]
valid=0
a.each do |x|
  if req-x.keys==[]
    if (1920..2002).include?(x["byr"].to_i)
      if (2010..2020).include?(x["iyr"].to_i)
        if (2020..2030).include?(x["eyr"].to_i)
          if ((x["hgt"]=~/cm/ && (150..193).include?(x["hgt"].to_i)) or (x["hgt"]=~/in/ && (59..76).include?(x["hgt"].to_i)))
            if (x["hcl"]=~/#\h{6}/ && x["hcl"].length==7)
              if ecl.include?(x["ecl"])
                if (x["pid"]=~/\d{9}/ && x["pid"].length==9)
                  valid+=1
                end
              end
            end
          end
        end
      end
    end
  end
end
pp valid
