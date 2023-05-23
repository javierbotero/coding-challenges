def twoStrings(s1, s2)
    # Write your code here
  arr1 = s1.split('').uniq
  arr2 = s2.split('').uniq

  (arr1 - arr2).length != arr1.length ? 'YES' : 'NO'
end

puts twoStrings('hello', 'world') == 'YES'
puts twoStrings('hi', 'world') == 'NO'
puts twoStrings('wouldyoulikefries', 'abcabcabcabcabcabc') == 'NO'
