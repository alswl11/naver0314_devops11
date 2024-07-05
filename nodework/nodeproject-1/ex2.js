let m1 = require("./modufunc.js");
console.log("모듈 1의 함수 호출 : " + m1.add(10, 20));
let age = 21;
console.log("%d 세는 %s입니다.", age, m1.check(age));

let m2 = require("./modufunc2.js");
let score = 78;
console.log("두 수의 곱 : " + m2.mul(2, 4));
console.log("%d 점은 %s 학점입니다", score, m2.grade(score));
