//oh. wait no this one is just pure math.
//so I will generalize it... to any n?

function isPrime(n) {
  if (n < 2) return false;
  for (let i = 2; i <= Math.sqrt(n); i++) {
    if (n % i == 0) return false;
  }
  return true;
}

function Main(n) {
  let sol = 1;
  for (let i = 1; i <= n; i++) {
    if (isPrime(i)) {
      let exp = Math.floor(Math.log(n)/ Math.log(i));
      console.log(`Number of ${i}'s : ${exp}`);
      sol *= Math.pow(i,exp);
    }
  }
  return sol;
}

console.log(Main(20));