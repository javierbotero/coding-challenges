const maxProfit = (prices) => {
  let diff = 0;
  let start = Infinity;
  prices.forEach((pr) => {
    if (pr < start) {
      start = pr;
    } else {
      const temp = pr - start;
      diff = temp > diff ? temp : diff;
    }
  });
  return diff;
};

console.log(maxProfit([7, 1, 5, 3, 6, 4]) === 5);
console.log(maxProfit([7, 6, 4, 3, 1]) === 0);
