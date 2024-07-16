import React from 'react';
import {Alert} from "@mui/material";
import img1 from '../image/s4.JPG';
import {NavLink, Route, Routes} from "react-router-dom";
import Moim1 from "./Moim1";
import Moim2 from "./Moim2";
import Moim3 from "./Moim3";

const Member = () => {
    return (
        <div>
            <Alert severity="error" style={{fontSize : "20px"}}>저의 모임 목록입니다 - 중첩 라우터 공부</Alert>
            <img alt="" src={img1}/>
            <ul className="menu">
                <li>
                    <NavLink to={'/member/moin1'}>모임 #1</NavLink>
                </li>
                <li>
                    <NavLink to={'/member/moin2'}>모임 #2</NavLink>
                </li>
                <li>
                    <NavLink to={'/member/moin3'}>모임 #3</NavLink>
                </li>
            </ul>
            <div style={{clear : "both" , marginTop : "20px", width : "400px" , backgroundColor : "orange"}}>
                <Routes>
                    <Route path="moin1" element={<Moim1/>}></Route>
                    <Route path="moin2" element={<Moim2/>}></Route>
                    <Route path="moin3" element={<Moim3/>}></Route>
                </Routes>
            </div>
        </div>
    );
};

export default Member;