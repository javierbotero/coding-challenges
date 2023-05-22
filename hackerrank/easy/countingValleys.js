function countingValleys(steps, path) {
  // Write your code here
  let level = 0;
  let counter = 0;
  let down = false;
  path.split('').forEach(char => {
    switch(char) {
      case 'U':
        level++;
        if (down && level === 0) {
          counter += 1;
          down = false;
        }
        break;
      case 'D':
        level--;
        if (level < 0 && !down) {
          down = true;
        }
    }
  });
  return counter;
}