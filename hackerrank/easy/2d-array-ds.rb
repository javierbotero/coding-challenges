def hourglassSum(arr)
  result = -1.0/0
  4.times do |i|
    4.times do |j|
      finish = j + 2
      tmp_sum = 0
      while j <= finish
        tmp_sum += arr[i][j]
        tmp_sum += arr[i + 1][j] if finish - j == 1
        tmp_sum += arr[i + 2][j]
        j += 1
      end
      result = tmp_sum > result ? tmp_sum : result
    end
  end
  result
end
