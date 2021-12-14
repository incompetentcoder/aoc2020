a=File.open("input3.txt").read.split
len=a[0].length
ind=0
trees=0
a.each do |x|
  trees+=1 if x[ind]=="#"
  ind=(ind+3)%len
end
pp trees

lines=a.length
slopes=[[1,1],[3,1],[5,1],[7,1],[1,2]]
sloptree=[]
slopes.each do |x,y|
  trees=0
  indx=0
  indy=0
  while indy < lines do
    trees+=1 if a[indy][indx] =="#"
    indx=(indx+x)%len
    indy+=y
  end
  sloptree.push(trees)
end

pp sloptree
pp sloptree.reduce(&:*)



