dict = 'dict'
file = 'txt'

f=File.open("#{dict}.md")
l=f.readlines
t=''
for i in 0..(l.length-1)
  s = l[i].match(/^(.*)\t(.*)$/)
  if s
    s = "#{s} ^#{i}\n\n"
    t=t+s
  end
end
File.open("#{dict}_.md",'w').write(t)
f=File.open("#{file}.md",'r').read
p f
for i in 0..(l.length-1)
  s=l[i].chomp.gsub(/^([^\t]*)\t[^\n]*$/,'\1')
  p s
  if l[i].chomp != ""
    f=f.gsub(/(#{s})/,"[[dict_#^#{i}|\\1]]")
  end
end
p f
File.open("#{file}_.md",'w').write(f)
