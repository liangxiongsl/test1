require 'clipboard'

def f
  s = Clipboard.paste.encode("UTF-8")
  s = s.gsub(/\s/,'')
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
