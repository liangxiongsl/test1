# 为 4 级标签新增了地址
require 'clipboard'

def f
  s = Clipboard.paste.encode("UTF-8")
  t=''
  cnt=0
  # s=s.gsub('==','')
  s.scan(/- (.*)$/) do |h|
    cnt+=1
    t="#{t}\n\r#### #{h[0][0..-1]}\n ^#{cnt}"
  end
  # puts t
  s = s.gsub(/- (.*)$/, '- [[#\1]]')
  s = "#{s}\n\r#{t}"

  Clipboard.copy(s)
  puts s
end

pre=''
while true
  sleep 0.5
  if pre!=Clipboard.paste.encode("UTF-8")
    f
    pre=Clipboard.paste.encode("UTF-8")
  end
end

