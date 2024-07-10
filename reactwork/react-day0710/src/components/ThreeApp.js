import React, {useRef, useState} from 'react';
import {Alert, Button} from "@mui/material";

// useRef : 변수를 관리하는 기능, 값이 변경되어도 다시 랜더링 되지 않는다

// 형식  (state 변수는 매번 화면이 랜더링 (refresh)된다)
// const ref = useRef(value);
// 값을 가져오려면
// ref.current

const ThreeApp = () => {

    const [count, setCount] = useState(1);
    const countRef = useRef(1);
    console.log("랜더링 중..");

    // count 변수 1 증가하는 이벤트
    const countIncre = () => setCount(count+1);
    // ref 변수 1 증가하는 이벤트
    const countRefInc = () => {
        countRef.current = countRef.current+1;
        console.log(countRef.current);
    }

    return (
        <div>
            <Alert>ThreeApp - useRef 공부하기</Alert>
            <h1>state 변수 : {count}</h1>
            <h1>ref 변수 : {countRef.current}</h1>
            <hr/>
            <Button variant="contained" color="success" onClick={countIncre}>state 변수 1 증가하기</Button>
            <br/><br/>
            <Button variant="contained" color="success" onClick={countRefInc}>ref 변수 1 증가하기</Button>

        </div>
    );
};

export default ThreeApp;