a=File.open("input16.txt").read.gsub(/\w+ \w+:\n/,"").split("\n\n")
require 'set'
bloop=Set.new
invalid=0
bleh=["departure location", "departure station", "departure platform", "departure track", "departure date", "departure time", "arrival location", "arrival station", "arrival platform", "arrival track", "class", "duration", "price", "route", "row", "seat", "train", "type", "wagon", "zone"]
a[0].scan(/\d+-\d+/).each do |x|
  tmp=x.split("-").map(&:to_i)
  bloop.merge(tmp[0].upto(tmp[1]))
end

a[2].scan(/\d+/).map{|x| x.to_i}.each do |x|
  invalid+=x unless bloop.include?(x)
end

pp invalid

nurf={}
a[0].split("\n").map {|x| x.split(": ")}.each do |x|
  tmp=x[1].scan(/\d+-\d+/).map {|z| z.split("-").map(&:to_i)}
  tmp.each do |y|
    y[0].upto(y[1]).each do |z|
      nurf[z]=[] unless nurf[z]
      nurf[z].push(x[0])
    end
  end
end

vals=[]
bla=nurf.keys
(a[1]+a[2]).split("\n").map{|x| x.split(",").map{|y| y.to_i}}.each do |x|
  next unless x - bla == []
  vals.push(x.map {|y| nurf[y]})
end

fields=[]
0.upto(vals[0].length-1).each do |x|
  fields[x]=vals[0][x]
  1.upto(vals.length-1).each do |y|
    fields[x]= fields[x] & vals[y][x]
  end
end

fields2=fields.each_with_index.sort_by{|x,y| x.length}
mine=a[1].split(",").map{|y| y.to_i}

derp=[]
fields2[0][0].each do |x|
  derp[0]=x
  (fields2[1][0]-derp).each do |x1|
    derp[1]=x1
    (fields2[2][0]-derp).each do |x2|
      derp[2]=x2
      (fields2[3][0]-derp).each do |x3|
        derp[3]=x3
        (fields2[4][0]-derp).each do |x4|
          derp[4]=x4
          (fields2[5][0]-derp).each do |x5|
            derp[5]=x5
            (fields2[6][0]-derp).each do |x6|
              derp[6]=x6
              (fields2[7][0]-derp).each do |x7|
                derp[7]=x7
                (fields2[8][0]-derp).each do |x8|
                  derp[8]=x8
                  (fields2[9][0]-derp).each do |x9|
                    derp[9]=x9
                    (fields2[10][0]-derp).each do |x10|
                      derp[10]=x10
                      (fields2[11][0]-derp).each do |x11|
                        derp[11]=x11
                        (fields2[12][0]-derp).each do |x12|
                          derp[12]=x12
                          (fields2[13][0]-derp).each do |x13|
                            derp[13]=x13
                            (fields2[14][0]-derp).each do |x14|
                              derp[14]=x14
                              (fields2[15][0]-derp).each do |x15|
                                derp[15]=x15
                                (fields2[16][0]-derp).each do |x16|
                                  derp[16]=x16
                                  (fields2[17][0]-derp).each do |x17|
                                    derp[17]=x17
                                    (fields2[18][0]-derp).each do |x18|
                                      derp[18]=x18
                                      (fields2[19][0]-derp).each do |x19|
                                        derp[19]=x19
                                        if bleh - derp == []
                                          pp derp.each_with_index.map{|x,y| fields2[y][1] if x=~/depart/}.compact.map{|x| mine[x]}.reduce(:*)
                                          exit
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

