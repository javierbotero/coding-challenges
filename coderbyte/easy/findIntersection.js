function FindIntersection(strArr) {
  // code goes here
  const arr1 = strArr[0].split(', ');
  const arr2 = strArr[1].split(', ');
  const intersection = arr1.filter(el => arr2.includes(el));
  return intersection.length > 0 ? intersection.join(', ') : false
}

console.log(FindIntersection(["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]) === "1, 4, 13");
