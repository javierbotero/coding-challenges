var threeSum = function(nums) {
  const result = [];
  nums.sort((a, b) => { return a - b });
  nums.forEach((n, i) => {
    if (i > 0 && n === nums[i - 1]) { return }
    let l = i + 1;
    let r = nums.length - 1;
    const used = [];
    while (l < r) {
      const total = n + nums[l] + nums[r];
      if (total > 0) {
        r -= 1;   
      } else if (total < 0) {
        l += 1;   
      } else {
        result.push([n, nums[l], nums[r]]);
        l += 1;  
        while (nums[l] === nums[l - 1] && l < nums.length) { 
          l += 1;
        }  
      } 
    }  
  })
  return result;
};
