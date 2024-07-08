// 클래스 형태의 컴포넌트
// hooks 문법이 추가된 이후로 class 보다는

import { Component } from "react";
import car1 from '../mycar7.png';
import car2 from '../mycar6.png';
import car3 from '../mycar5.png';
import './MyStyle.css';

class OneApp extends Component {
    render() {
        return(
            <div>
                <h1 className="alert alert-danger">OneApp - class 형태</h1>
                <h5>public의 사진 가져오기</h5>
                <img src="./8.jpg" alt="사진1" width={200}/>
                <img src="./7.jpg" alt="사진2" style={{width : '200px', border : '5px solid green', borderRadius : '50px 20px 100px 10px'}}/>

                <h5> src 폴더의 사진 가져오기 </h5>
                <img alt="자동차1" src={car1} className="photo line1"/>
                <img alt="자동차1" src={car2} className="photo line2"/>
                <img alt="자동차1" src={car3} className="photo line3"/>
            </div>
        );
    }
}
// export default OneApp; // 단 한번만 사용 가능, import 시 마음대로 이름을 지정할 수 있다.
export {OneApp}; // 이 경우에는 import 시에 정확한 이름으로 Import 해야 함