require 'find'
path='E:\LX\onedrive\obsidian\英语词义分类数据库（大学版）（带词汇表目录）'
a=[]
b=[]
Find.find(path) do |file|
  if file =~ /\d\d.*\.md/ && !(file =~ /00.*\.md/) && file != path
    # puts "#{line[0]}\t#{line[1]}"
    a.push file[path.length+1..-1]
    b.push File.open(file).read.scan(/\n/).length
  end
end
puts "#{a}".gsub(/[\[\]\"]/,'').gsub(/, /,',')
puts
puts "#{b}".gsub(/[\[\]\"]/,'').gsub(/, /,',')

