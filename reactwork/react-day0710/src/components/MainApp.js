import React, {useState} from 'react';
import OneApp from "./OneApp";
import TwoApp from "./TwoApp";
import ThreeApp from "./ThreeApp";
import FourApp from "./FourApp";
import FiveApp from "./FiveApp";
import SixApp from "./SixApp";

const MainApp = () => {
    const [idx, setIdx] = useState(1);
    const changeApp = (e) => {
        setIdx(Number(e.target.value));
    }
    return (
        <div>
            <h2>2024-07-10 리액트 수업</h2>
            <div>
                <label>
                    <input type="radio" name="app" defaultValue={1} onClick={changeApp}/>OneApp - 배열 추가, 삭제
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={2} onClick={changeApp}/>TwoApp - 배열 추가 삭제
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={3} onClick={changeApp}/>ThreeApp -useRef 공부하기
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={4} onClick={changeApp}/>FourApp - useRef 응용예제
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={5} onClick={changeApp}/>FiveApp - 부모자식간의 통신(1)
                </label>
                <br/>
                <label>
                    <input type="radio" name="app" defaultValue={6} onClick={changeApp}/>SixApp - 부모자식간의 통신(2)
                </label>
                <br/>
            </div>
            <hr/>
            {
                idx ===1?<OneApp/> : idx === 2 ? <TwoApp/> : idx === 3 ? <ThreeApp/> : idx === 4 ?
                    <FourApp/> : idx === 5 ? <FiveApp/> : <SixApp/>
            }
            
        </div>
    );
};

export default MainApp;