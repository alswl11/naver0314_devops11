import React from 'react';
import Menu from "../components/Menu";
import {Route, Routes} from "react-router-dom";
import Home from "../components/Home";
import BoardForm from "../components/BoardForm";
import BoardList from "../components/BoardList";
import BoardDetail from "../components/BoardDetail";
import '../components/MyStyle.css';
import UpdatePassForm from "../components/UpdatePassForm";
import UpdateForm from "../components/UpdateForm";
import DaumPostApp from "../components/DaumPostApp";
import SweetAlertApp from "../components/SweetAlertApp";
import ReducerComp1 from "../components/ReducerComp1";
import ReducerComp2 from "../components/ReducerComp2";
import MemoTest from "../components2/MemoTest";
import CallBackTest from "../components2/CallBackTest";
import MemberList from "../member/MemberList";
import MemberForm from "../member/MemberForm";
import LoginForm from "../member/LoginForm";


const RouterMain = () => {
    return (
        <div>
            <Menu/>
            <br style={{clear : "both"}}/>
            <Routes>
                <Route path="/" element={<Home/>}></Route>
                <Route path="/board">
                    <Route path='form' element={<BoardForm/>}/>
                    <Route path='list' element={<BoardList/>}/>
                    <Route path='detail/:boardnum' element={<BoardDetail/>}/>
                    <Route path='updatepass/:boardnum' element={<UpdatePassForm/>}/>
                    <Route path='updateform/:boardnum' element={<UpdateForm/>}/>
                </Route>
                <Route path="/post" element={<DaumPostApp/>}></Route>
                <Route path="/sweet" element={<SweetAlertApp/>}></Route>
                <Route path="/reducercomp1" element={<ReducerComp1/>}></Route>
                <Route path="/reducercomp2" element={<ReducerComp2/>}></Route>
                <Route path="/memo" element={<MemoTest/>}></Route>
                <Route path="/callback" element={<CallBackTest/>}></Route>
                <Route path="/member/list" element={<MemberList/>}></Route>
                <Route path="/member/form" element={<MemberForm/>}></Route>
                <Route path="/login" element={<LoginForm/>}></Route>
            </Routes>
        </div>
    );
};

export default RouterMain;