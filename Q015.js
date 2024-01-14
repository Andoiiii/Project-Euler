// Hey, I know how to solve these!
function pathsThroughGrid(n) {
    // It's (2n)! / n!n! 
    let retVar = BigInt(1);
    for (let i = BigInt(n + 1); i <= 2 * n; i++) {
        retVar *= i;
    }
    for (let j = BigInt(n); j > 0; j--) {
        retVar /= j;
    }
    return retVar;
}

console.log(pathsThroughGrid(20));