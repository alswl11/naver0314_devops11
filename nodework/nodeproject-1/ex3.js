//ES6 은 ECMA 에서 2015년에 채택한 자바스크립트 표준입니다
//ES6 에서 추가된 기능
/*
    1. 블록범위 변수 let 와 const
    2. 함수에서 기본 매개변수
    3. 템플릿 리터럴(Multline Literal) 
    4. 화살표 함수
    5. 프로미스 (Promise) : 프로미스는 비동기 작업을 조금 더 편하게 처리 할 수 있도록 ES6 에 도입된 기능입니다.
    6. 클래스,상속등등
    7. 모듈개념 추가
*/

const PI = 3.141592; //상수, 값변경 안됨
//PI=2.345;//오류 발생
let r = 3;
let area = r * r * PI;
console.log("반지름이 %d 인 원의 넓이 : %f", r, area);

//객체를 const 로 선언한 경우 주의할것
const pp = {
  name: "홍길동",
  addr: "서울시",
};

console.log("이름:" + pp.name);
console.log("주소:" + pp.addr);
//이름을 수정해보자
pp.name = "이수정"; //오류 안남, 멤버 각각은 수정이 가능
console.log("이름:" + pp.name);

//이런경우는 오류가 난다
pp = {
  name: "홍길동2",
  addr: "서울시2",
};
