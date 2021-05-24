def longest_palindrome(s, start = 0, last = s.length - 1)
  if start >= last
    result = s[start]
    first = start - 1
    finish = start + 1

    increase_both = Proc.new do |first, finish|
      while first >= 0 && s[first] == s[finish]
        result = s[first] + result
        result += s[finish]
        first -= 1
        finish += 1
      end
    end

    if first >= 0 && finish < s.length && s[first] == s[finish]
      increase_both.call(first, finish)
    elsif first >= 0 && (s[start] == s[first] || s[start] == s[finish])
      if first >= 0 && s[start] == s[first]
        while first >= 0 && s[start] == s[first]
          result = s[first] + result
          first -= 1
        end
      elsif s[start] == s[finish]
        while s[start] == s[finish]
          result += s[finish]
          finish += 1
        end
      end
      if start - 1 >= 0 && s[start] != s[start - 1]
        first = start - 1
      elsif start + 1 < s.length && s[start] != s[start + 1]
        finish = start + 1
      end
      increase_both.call(first, finish)
    end

    return result
  end

  middle = (start + last) / 2
  result1 = longest_palindrome(s, middle == start ? middle + 1 : middle, last)
  result2 = longest_palindrome(s, start, middle == 0 ? 0 : middle - 1)
  result1.length <= result2.length ? result2 : result1
end

puts longest_palindrome('babad') == 'bab' || longest_palindrome('babad') == 'aba'
puts longest_palindrome('cbbd') == 'bb'
puts longest_palindrome('a') == 'a'
puts longest_palindrome('ac') == 'a'
puts longest_palindrome('bb') == 'bb'
puts longest_palindrome('tattarrattat') == 'tattarrattat'
