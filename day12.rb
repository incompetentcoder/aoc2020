a=File.open("input12.txt").read.split("\n")
dirs=["E","S","W","N"]
dists={"E"=>0,"S"=>0,"W"=>0,"N"=>0}
dir=0
a.each do |x|
  case x[0]
  when /[ESWN]/
    dists[x[0]]+=x[1..-1].to_i
  when "L"
    dir=(dir - x[1..-1].to_i()/90)%4
  when "R"
    dir=(dir + x[1..-1].to_i()/90)%4
  when "F"
    dists[dirs[dir]]+=x[1..-1].to_i
  end
end
pp (dists["E"]-dists["W"]).abs+(dists["S"]-dists["N"]).abs

dirs={"E"=>0,"S"=>1,"W"=>2,"N"=>3}
dirsr=dirs.invert
dists={"E"=>0,"S"=>0,"W"=>0,"N"=>0}
wp=[10,0,0,1]
a.each do |x|
  case x[0]
  when /[ESWN]/
    wp[dirs[x[0]]]+=x[1..-1].to_i
  when "L"
    wp.rotate!(x[1..-1].to_i()/90)
  when "R"
    wp.rotate!(-x[1..-1].to_i()/90)
  when "F"
    wp.each_with_index {|z,zz| dists[dirsr[zz]]+=x[1..-1].to_i()*z}
  end
end
pp (dists["E"]-dists["W"]).abs+(dists["S"]-dists["N"]).abs





