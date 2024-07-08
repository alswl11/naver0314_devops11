// main 에 각종 컴포넌트 배치
// 이번에는 함수형으로

import { Component } from "react";
import {OneApp} from "./OneApp";
import TwoApp from "./TwoApp";
import ThreeApp from "./ThreeApp";

const Main=()=>{
    return(
        <div>
            <ThreeApp/>
            <hr/>
            <TwoApp/>
            <hr/>
            <OneApp/>
            <hr/>
        </div>
    )
}

export default Main;