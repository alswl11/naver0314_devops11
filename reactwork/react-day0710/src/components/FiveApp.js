import React from 'react';
import {Alert} from "@mui/material";
import FiveChildApp from "./FiveChildApp";
import FiveChild2App from "./FiveChild2App";

const FiveApp = () => {
    return (
        <div>
            <Alert>FiveApp - 부모/자식 컴포넌트 통신(1)</Alert>
            <h5>FiveChildApp 컴포넌트 호출</h5>
            <FiveChildApp irum={"이영자"} age={23} addr={"서울시"}/>
            <FiveChildApp irum={"강호동"} age={53} addr={"경기도"}/>
            <FiveChildApp irum={"손흥민"} age={33} adr={"제주도"}/>

            <h5>FiveChild2App 컴포넌트 호출</h5>
            <FiveChild2App irum="이미자" photo={"1.jpg"} msg = "노 랑이 차 "/>
            <FiveChild2App irum="강미자" photo={"2.jpg"} msg = "분홍이 차 "/>
        </div>
    );
};

export default FiveApp;