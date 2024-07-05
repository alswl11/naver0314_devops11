// es6의 라이브러리 number

let a = 12;
let b = 23.0;
let c = 12.6;

console.log(a + "는  정수인가? " + Number.isInteger(a));
console.log(b + "는  정수인가? " + Number.isInteger(b));
console.log(c + "는  정수인가? " + Number.isInteger(c));

let a1 = "NaN";
let b1 = NaN;
let c1 = "안녕";
let d1 = 123;
console.log("es5의 isNaN은 숫자일 경우 false, 숫자가 아닐경우 true");
console.log("a1 = " + isNaN(a1));
console.log("b1 = " + isNaN(b1));
console.log("c1 = " + isNaN(c1));
console.log("d1 = " + isNaN(d1));

console.log("es6의 Number.isNaN은 정말 NaN인 경우에만 true");
// NaN은 수식 오류가 잇을 경우에도 발생
console.log(12 / "a"); // 대놓고 오류인 경우 : NaN 발생

console.log("=".repeat(30));
