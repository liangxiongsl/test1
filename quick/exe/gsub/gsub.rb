# 为 4 级标签新增了地址
require 'clipboard'

def f
  s = Clipboard.paste.encode("UTF-8")
  l=File.open('in.txt','r').readlines

  # s = s.gsub(/#{l[0]}/,l[1])
  s = s.gsub(/#{l[0].chomp}/,l[1].chomp)
  Clipboard.copy(s)
  puts s
end

pre=''
while true
  sleep 0.1
  if pre!=Clipboard.paste.encode("UTF-8")
    f
    pre=Clipboard.paste.encode("UTF-8")
  end
end

