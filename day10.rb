a=File.open("input10.txt").lines.map(&:to_i).sort.each_cons(2).map{|x| x[1]-x[0]}.prepend(1).append(3)
argh={"11"=>2,"111"=>4,"1111"=>7}
pp a.count(1)*a.count(3),a.join.scan(/(1{2,})/).map{|x| argh[x[0]]}.reduce(&:*)
