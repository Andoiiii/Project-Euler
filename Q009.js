// Find a < b < c so that a^2 + b^2 = c^2 and a + b + c = 1000
// return abc

// Let's minimize the coding by doing some math!
// a + b + c = 1000
// a^2 + b^2 + c^2 + 2ab + 2ac + 2bc = 1,000,000
// (c^2) + c^2 + 2ab + 2ac + 2bc = 1,000,000
// c^2 + ab + ac + bc = 500,000
// ab + c(a + b + c) = 500,000
// ab + 1000c = 500000
// ab + 1000(1000 - a - b) = 500000
// ab - 1000a - 1000b = -500000
// 1000a + 1000b - ab = 500,000
// a + b - ab/1000 = 500 (ab/1000 is an integer)

for (let a = 1; a <= 1000; a++) {
  for (let b = 1; b <= 1000; b++) {
    if (a < b && a*b % 1000 === 0 && a + b - a*b/1000 === 500) {
      console.log(`Solution: ${a} ${b} ${1000-a-b}. Product: ${a*b*(1000-a-b)}`)
    }
  }
}
