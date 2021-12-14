a=File.open("input5.txt").read.tr("FL","0").tr("BR","1").split("\n").map {|x| x.to_i(2)}.sort
pp a[-1]
pp (a[0]..a[-1]).to_a - a
