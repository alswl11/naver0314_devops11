// 함수 파라미터 기본값
// function func(x, y = 100, z = 200) {
//   console.log(x, y, z);
// }

// 위의 함수를 화살표함수로 변경해보자
let func = (x, y = 100, z = 200) => console.log(x, y, z);

// 두 수의 합을 리턴하는 함수
let add = (a, b) => a + b; // 리턴 생략

// 두 수의 곱을 리턴하는 함수
let mul = (a, b) => a * b; // 리턴 생략
// 함수를 호출
func(4);
func(5, 6);
func(1, 2, 3);
console.log(add(3, 6));
console.log(mul(5, 7));
