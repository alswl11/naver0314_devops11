// 컬렉션 : set, map
// set : 중복 허용 안함
let set1 = new Set("ababab");
console.log("set1의 갯수 : " + set1.size);
set1.add(12);
console.log("set1의 갯수 : " + set1.size);

// 펼침연산자 이용해서 값들 확인하기
console.log(...set1);
set1.delete("b");
console.log("set1의 갯수 : " + set1.size);
console.log(...set1);
set1.clear();
console.log("set1의 갯수 : " + set1.size);

// map : key, value 의 쌍으로 저장되는 형태
let map1 = new Map();
let a = { n: 1 };
map1.set(a, "A"); // key 값이 json 형태가 될 수 있다
map1.set("name", "김태희");
console.log(map1.size);
// map1 전체 출력
console.log(...map1);
console.log(map1.has("name")); // key 값에 name이 잇느냐 = ture
console.log(map1.has("blood")); // key 값에 name이 잇느냐 = false

// name이라는 key 값에 해당하는 데이터를 제거
map1.delete("name");
console.log(map1.has("name")); // key 값에 name이 잇느냐 = false
// 전체 제거
map1.clear();
console.log("전체 제거 후 갯수 : " + map1.size);
