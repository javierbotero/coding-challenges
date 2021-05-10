const lengthOfLongestSubstring = function (s) {
  const i = 0;
  const length = 0;
  while (i < s.length && length < (s.length - i + 1)) {
    const used = [];
    while (!used.includes(s[i])) {
      used.push(s[i]);
    }
  }
};
