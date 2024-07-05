// 상속
class AA {
  constructor(name) {
    this.name = name;
  }
  printName() {
    console.log("이름 : " + this.name);
  }
}

class BB extends AA {
  constructor(name, addr) {
    super(name); // 상속인 경우, super()라도 생략안됨
    this.addr = addr;
  }
  printInfo() {
    this.printName();
    console.log("주소 : " + this.addr);
  }
}

// 선언
let bb = new BB("son", "서울");
bb.printInfo();
