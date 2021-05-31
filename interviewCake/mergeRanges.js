function mergeRanges(meetings, pointer = 0) {
  if (pointer >= meetings.length - 1) {
    return meetings.sort((first, second) => {
      if (first.startTime <= second.startTime) {
        return -1;
      }
      return 1;
    });
  }

  const result = pointer === 0 ? [meetings[pointer]] : meetings.slice(0, pointer + 1);
  const merge = (earlier, later, newValue) => {
    if (earlier.endTime >= later.startTime) {
      if (earlier.endTime >= later.endTime) {
        result[pointer] = earlier;
      } else {
        result[pointer] = { startTime: earlier.startTime, endTime: later.endTime };
      }
    } else {
      result.push(newValue);
    }
  };

  let i = pointer + 1;

  while (i < meetings.length) {
    if (result[pointer].startTime < meetings[i].startTime) {
      merge(result[pointer], meetings[i], meetings[i]);
    } else {
      merge(meetings[i], result[pointer], meetings[i]);
    }
    i += 1;
  }

  return mergeRanges(result, pointer + 1);
}

// Tests

let desc = 'meetings overlap';
let actual = mergeRanges([{ startTime: 1, endTime: 3 }, { startTime: 2, endTime: 4 }]);
let expected = [{ startTime: 1, endTime: 4 }];
assertArrayEquals(actual, expected, desc);

desc = 'meetings touch';
actual = mergeRanges([{ startTime: 5, endTime: 6 }, { startTime: 6, endTime: 8 }]);
expected = [{ startTime: 5, endTime: 8 }];
assertArrayEquals(actual, expected, desc);

desc = 'meeting contains other meeting';
actual = mergeRanges([{ startTime: 1, endTime: 8 }, { startTime: 2, endTime: 5 }]);
expected = [{ startTime: 1, endTime: 8 }];
assertArrayEquals(actual, expected, desc);

desc = 'meetings stay separate';
actual = mergeRanges([{ startTime: 1, endTime: 3 }, { startTime: 4, endTime: 8 }]);
expected = [{ startTime: 1, endTime: 3 }, { startTime: 4, endTime: 8 }];
assertArrayEquals(actual, expected, desc);

desc = 'multiple merged meetings';
actual = mergeRanges([
  { startTime: 1, endTime: 4 },
  { startTime: 2, endTime: 5 },
  { startTime: 5, endTime: 8 },
]);
expected = [{ startTime: 1, endTime: 8 }];
assertArrayEquals(actual, expected, desc);

desc = 'meetings not sorted';
actual = mergeRanges([
  { startTime: 5, endTime: 8 },
  { startTime: 1, endTime: 4 },
  { startTime: 6, endTime: 8 },
]);
expected = [{ startTime: 1, endTime: 4 }, { startTime: 5, endTime: 8 }];
assertArrayEquals(actual, expected, desc);

desc = 'oneLongMeetingContainsSmallerMeetings';
actual = mergeRanges([
  { startTime: 1, endTime: 10 },
  { startTime: 2, endTime: 5 },
  { startTime: 6, endTime: 8 },
  { startTime: 9, endTime: 10 },
  { startTime: 10, endTime: 12 },
]);
expected = [
  { startTime: 1, endTime: 12 },
];
assertArrayEquals(actual, expected, desc);

desc = 'sample input';
actual = mergeRanges([
  { startTime: 0, endTime: 1 },
  { startTime: 3, endTime: 5 },
  { startTime: 4, endTime: 8 },
  { startTime: 10, endTime: 12 },
  { startTime: 9, endTime: 10 },
]);
expected = [
  { startTime: 0, endTime: 1 },
  { startTime: 3, endTime: 8 },
  { startTime: 9, endTime: 12 },
];
assertArrayEquals(actual, expected, desc);

function assertArrayEquals(a, b, desc) {
  // Sort the keys in each meeting to avoid
  // failing based on differences in key order.
  orderedA = a.map((meeting) => JSON.stringify(meeting, Object.keys(meeting).sort()));
  orderedB = b.map((meeting) => JSON.stringify(meeting, Object.keys(meeting).sort()));
  const arrayA = JSON.stringify(orderedA);
  const arrayB = JSON.stringify(orderedB);
  if (arrayA !== arrayB) {
    console.log(`${desc} ... FAIL: ${JSON.stringify(a)} != ${JSON.stringify(b)}`);
  } else {
    console.log(`${desc} ... PASS`);
  }
}
