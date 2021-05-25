const findCircleNum = function (isConnected) {
  let provinces = 0;
  const visited = [];
  const recursion = city => {
    visited.push(city);
    isConnected[city].forEach((cty, i) => {
      if (!visited.includes(i) && cty === 1) {
        recursion(i);
      }
    });
  };
  isConnected[0].forEach((connection, i) => {
    if (!visited.includes(i)) {
      recursion(i);
      provinces += 1;
    }
  });

  return provinces;
};

console.log(findCircleNum([[1, 1, 0, 1], [1, 1, 1, 0], [0, 1, 1, 0], [0, 0, 0, 1]]) === 2);
console.log(findCircleNum([[1, 0, 0], [0, 1, 0], [0, 0, 1]]) === 3);
console.log(findCircleNum([[1, 0, 0, 1], [0, 1, 1, 0], [0, 1, 1, 1], [1, 0, 1, 1]]) === 1);
