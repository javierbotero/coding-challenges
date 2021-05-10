const twoSum = function (nums, target) {
  for (let i = 0; i < nums.length - 1; i += 1) {
    for (let a = i + 1; a < nums.length; a += 1) {
      if (nums[i] + nums[a] === target) {
        return [i, a];
      }
    }
  }
};