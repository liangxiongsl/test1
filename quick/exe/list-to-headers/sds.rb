# 为 4 级标签新增了地址
require 'clipboard'

def f
  s = Clipboard.paste.encode("UTF-8")

  t = s
  t = t.gsub(/^        [\-\.\d]* (.*)$/, "#### \\1")
  # puts t
  t = t.gsub(/^    [\-\.\d]* (.*)$/, "### \\1")
  t = t.gsub(/^[\-\.\d]* (.*)$/, "## \\1")

  out = "### 大纲\n\r#{s}\n\r\n\r#{t}"
  # Clipboard.copy(out)
  puts t
end

pre=''
while true
  sleep 0.5
  if pre!=Clipboard.paste.encode("UTF-8")
    f
    pre=Clipboard.paste.encode("UTF-8")
  end
end

