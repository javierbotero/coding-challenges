function checkMagazine(magazine, note) {
    // Write your code here
  if (magazine.length < note.length) {
    console.log('No');
    return;
  }

  const wordsMagazine = magazine.reduce((acc, val) => {
    if (val in acc) {
      acc[val] += 1;
    } else {
      acc[val] = 1;
    }
    return acc;
  }, {});

  for(let i = 0; i < note.length; i += 1) {
    const word = note[i];

    if (word in wordsMagazine) {
      if (wordsMagazine[word] == 0) {
        console.log('No');
        return;
      }
      wordsMagazine[word] -= 1;
    } else {
      console.log('No');
      return;
    }
  }

  console.log('Yes');
}
