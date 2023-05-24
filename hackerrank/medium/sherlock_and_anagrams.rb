def sherlockAndAnagrams(s)
  dictionary = populate_dictionary(s)
  dictionary.reduce(0) do |memo, val|
    memo + pairs(val[1])
  end
end

def populate_dictionary(s, dictionary = {}, ranges = [], start = 0, finish = s.length - 1)
  return if start > finish

  ranges.push("#{start},#{finish}")
  key = s[start..finish].split('').sort.join
  dictionary.has_key?(key) ? dictionary[key] += 1 : dictionary[key] = 1

  populate_dictionary(s, dictionary, ranges, start, finish - 1) unless ranges.any?("#{start},#{finish - 1}")
  populate_dictionary(s, dictionary, ranges, start + 1, finish) unless ranges.any?("#{start + 1},#{finish}")

  dictionary
end

def pairs(num)
  return 0 if num < 2

  (num - 1) + pairs(num - 1)
end

puts sherlockAndAnagrams("abba") == 4
puts sherlockAndAnagrams("abcd") == 0
puts sherlockAndAnagrams("cdcd") == 5
