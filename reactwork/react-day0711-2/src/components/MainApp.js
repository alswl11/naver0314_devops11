import React, {useState} from 'react';
import OneApp from "./OneApp";
import TwoApp from "./TwoApp";
import ThreeApp from "./ThreeApp";
import FourApp from "./FourApp";
import FiveApp from "./FiveApp";
import SixApp from "./SixApp";

const MainApp = () => {
    const [idx, setIdx] = useState(1);
    const changeApp=(e)=> {
        setIdx(Number(e.target.value));
    }
    return (
        <div>
            <h2>2024-07-11, 12 리액트 수업</h2>
            <div style={{fontSize: "16px"}}>
                <label>
                    <input type="radio" name="app" defaultValue={1} onClick={changeApp}/>OneApp - 모든 입력값 하나의 변수에 넣기
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={2} onClick={changeApp}/>TwoApp - 데이터 추가, 삭제, 출력 (부모 /
                    자식 컴포넌트)
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={3} onClick={changeApp}/>ThreeApp - json 데이터 출력읽기 문제
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={4} onClick={changeApp}/>FourApp - json 데이터 읽기 문제
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={5} onClick={changeApp}/>FiveApp - Root-useContext 공부
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={6} onClick={changeApp}/>SixApp - Axios db 데이터 가져오기
                </label>
            </div>
            <hr/>
            {
                idx===1?<OneApp/>:idx===2?<TwoApp/>:idx===3?<ThreeApp/>:idx===4?<FourApp/>:idx===5?<FiveApp/>:<SixApp/>
            }
        </div>
    );
};

export default MainApp;