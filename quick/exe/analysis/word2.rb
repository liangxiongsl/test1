require 'find'
path='E:\LX\onedrive\obsidian\英语词义分类数据库（大学版）（带词汇表目录）'

a=[]
b=[]
c=[]
d=[]
Find.find(path) do |f|
  if !(f=~/\./) && f != path && !(f=~/00/) && f=~/\/\d\d/
    len=0
    line=0
    Find.find(f) do |f1|
      if f1 =~ /\d\d.*\.md/ && !(f1 =~ /00.*\.md/) && f1 != f
        len+=1
        line+=File.open(f1).read.scan(/\n/).length
      end
    end
    a.push f[path.length+1..-1]
    b.push len
    c.push line
    d.push 1.0*line/len
  end
end
puts "#{a}".gsub(/[\[\]\"]/,'')
puts
puts "#{b}".gsub(/[\[\]\"]/,'')
puts
puts "#{c}".gsub(/[\[\]\"]/,'')
puts
puts "#{d}".gsub(/[\[\]\"]/,'')
