require 'clipboard'

def f
  s = Clipboard.paste.encode("UTF-8")
  s = s.gsub(/^(\d*\..*)$/,'## \1')
  s = s.gsub(/^- (.*)$/,'## \1')
  s = s.gsub(/^ {4}(\d*\..*)$/,'### \1')
  s = s.gsub(/^ {4}- (.*)$/,'### \1')
  s = s.gsub(/^ {8}(\d*\..*)$/,'#### \1')
  s = s.gsub(/^ {8}- (.*)$/,'#### \1')
  s = s.gsub(/^ {12}(\d*\..*)$/,'##### \1')
  s = s.gsub(/^ {12}- (.*)$/,'##### \1')
  s = s.gsub(/^ {16}(\d*\..*)$/,'###### \1')
  s = s.gsub(/^ {16}- (.*)$/,'###### \1')
  s = s.gsub(/^ {20}(\d*\..*)$/,'####### \1')
  s = s.gsub(/^ {20}- (.*)$/,'####### \1')
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

