def solution(s)
  i = 0
  result = ''
  while i < s.length
    if /[0-9]/.match s[i]
      result = if result.length > 0 && (result.length + 1) % 4 == 0
                 result += "-#{s[i]}"
               else
                 result += s[i]
               end
    end

    i += 1
  end

  if result.length > 4 && result[result.length - 2] == '-'
    result[result.length - 2], result[result.length - 3] = result[result.length - 3], result[result.length - 2]
  end

  result
end

puts solution('0 - 22 1985--324') == '022-198-53-24'
puts solution('------0     2     2-6          ') == '02-26'
puts solution('------0     2     2-          ') == '022'
puts solution('------0     2     -----------') == '02'
