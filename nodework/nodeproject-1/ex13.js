let array = ["red", "green", "blue", "pink"];
array.map((num, idx) => console.log(idx + ":" + num));
// blue 삭제 후 다시 출력
console.log("\n");
// 2번 index만 제외하고 다시 배열에 담기
array = [...array.slice(0, 2), ...array.slice(3, array.length)];
array.map((num, idx) => console.log(idx + ":" + num));

let array2 = ["red", "green", "blue", "pink"];
console.log("\n");
array2.map((num, idx) => console.log(idx + ":" + num));
// 2번마나 제외하고 배열에 담기
console.log("\n");
array2 = array2.filter((item, i) => i != 2);
array2.map((num, idx) => console.log(idx + ":" + num));
