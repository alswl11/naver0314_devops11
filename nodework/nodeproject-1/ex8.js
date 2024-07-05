// Number.isNaN을 이용한 함수
let r = (w, h) => {
  if (Number.isNaN(w * h)) {
    return "가로, 세로 값이 숫자가 아닙니다,";
  } else {
    let a = `가로가 ${w}cm, 세로가 ${h}cm인 사각형의 넓이는 ${w * h}입니다.`;
    return a;
  }
};

// 함수 호출
console.log(r(5, 6));
console.log("=".repeat(30));
console.log(r("a", "b"));
console.log("=".repeat(30));
console.log(r(10, "a"));
