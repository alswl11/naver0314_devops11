// es6에서 class가 추가
// 그 전에는 class 가 없고 개념만 잇엇음

class Student {
  // 클래스명과 상관없이 무조건 constructor (생성자)
  constructor(name) {
    this.name = name;
  }
}

// 클래스 생성
let s1 = new Student("lee");
console.log("이름 : " + s1.name);

// 방법 2
let Sawon = class {
  constructor(name, buseo) {
    this.name = name;
    this.buseo = buseo;
  }
};

// 클래스 생성
let sa1 = new Sawon("son", "인사부");
let sa2 = new Sawon("kin", "교육부");
console.log(`${sa1.name}님은 ${sa1.buseo}입니다`);
console.log(`${sa2.name}님은 ${sa2.buseo}입니다`);
