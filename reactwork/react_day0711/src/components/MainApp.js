import React, {useState} from 'react';
import OneApp from "./OneApp";
import TwoApp from "./TwoApp";
import ThreeApp from "./ThreeApp";
import FourApp from "./FourApp";

const MainApp = () => {
    const [idx,setIdx]=useState(1);

    const changeApp=(e)=>{
        setIdx(Number(e.target.value));
    }

    return (
        <div>
            <h2>2024-07-11 리액트 수업</h2>
            <div style={{fontSize:'16px'}}>
                <label>
                    <input type='radio' name='app' defaultValue={1}
                           onClick={changeApp}/>OneApp-모든 입력값 하나의 변수에 넣기
                </label>
                <br/>
                <label>
                    <input type='radio' name='app' defaultValue={2}
                           onClick={changeApp}/>TwoApp-객체 배열 출력 tr의 rowSpan
                </label>
                <br/>
                <label>
                    <input type='radio' name='app' defaultValue={3}
                           onClick={changeApp}/>ThreeApp-데이터 추가, 삭제, 출력(부모 자식 컴포넌트)
                </label>
                <br/>
                <label>
                    <input type='radio' name='app' defaultValue={4}
                           onClick={changeApp}/>FourApp-문제
                </label>
            </div>
            <hr/>
            {
                idx===1?<OneApp/>:idx===2?<TwoApp/>:idx===3?<ThreeApp/>:<FourApp/>
            }
        </div>
    );
};

export default MainApp;