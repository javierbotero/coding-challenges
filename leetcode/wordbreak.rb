def word_break(s, word_dict, memoized = Set[])
  return true if s.length < 1
  return false if memoized.include?(s)  
  puts s  
  
  l = 0  
  while l < s.length  
    return true if word_dict.include?(s[0..l]) && word_break(s[l + 1..s.length - 1], word_dict, memoized)
    memoized.add(s) 
    l += 1
  end 
  false  
end