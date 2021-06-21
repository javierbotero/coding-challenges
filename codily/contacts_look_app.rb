def solution(a, b, p)
  name = ''
  b.each_with_index do |word, i|
    if word.include? p
      name = a[i] if name.length == 0 || a[i] < name
    end
  end
  name.length == 0 ? 'NO CONTACT' : name
end

# puts solution(['pim', 'pom'], ['999999999', '777888999'], '88999') == 'pom'
puts solution(['adam', 'eva', 'leo'], ['121212121', '111111111', '444555666'], '112') == 'NO CONTACT'
puts solution(['adam', 'eva', 'leo'], ['121212121', '111111111', '121212121'], '121') == 'adam'
puts solution(['adam'], ['121212121'], '121') == 'adam'
puts solution(['adam'], ['121212121'], '131') == 'NO CONTACT'