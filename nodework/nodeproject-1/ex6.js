// 객체에서 멤버값 얻기
let obj1 = { name: "lee", age: 23, addr: "Seoul" };
console.log(obj1.name);
console.log(obj1.age);
console.log(obj1.addr);
console.log("===========");

// 오브젝트 통으로 대입
let obj2 = obj1;
console.log(obj2.name);
console.log(obj2.age);
console.log(obj2.addr);
console.log("===========");

// 객체에서 각각의 멤버값 얻기
let name1 = obj1.name;
let age1 = obj1.age;
console.log(name1, age1);
console.log("===========");

// ES6 문법
// 객체에서 멤버값 얻는 방법
let { name, age } = obj1;
console.log("es6 name = " + name);
console.log("es6 age = " + age);
console.log("===========");

// 함수에서 매개변수로 객체타입을 받는데 초기값을 지정하는 방법
function f1({ name = "수지", age = 22 } = {}) {
  console.log("name : " + name);
  console.log("age : " + age);
  console.log("===========");
}

// f1 함수 호출하기
f1();
f1(obj1);
