# 为无序列表建立 4 级标题，并提供出链
require 'clipboard'

def f
  s = Clipboard.paste.encode("UTF-8")
  t=''
  # s=s.gsub('==','')
  s.scan(/- (.*)$/) { |h| t="#{t}\n\r#### #{h[0][0..-1]}" }
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

