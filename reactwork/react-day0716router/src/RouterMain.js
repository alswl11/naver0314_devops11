import React from 'react';
import Menu from "./compoents/Menu";
import {Route, Routes} from "react-router-dom";
import {Food, About, Home} from "./pages";
import photo1 from './image/s5.JPG';
import photo2 from './image/s2.JPG';
import './compoents/MyStyle.css';
import Member from "./pages/Member";
import MyCar from "./pages/MyCar";

const RouterMain = () => {
    return (
        <div>
            <Menu/>
            <hr style={{clear:"both"}}/>
            <Routes>
                <Route path='/' element={<Home/>}/>
                {/*<Route path='/food' element={<Food/>}/>*/}
                <Route path='/food' element={<Food/>}>
                    <Route path=':food1' element={<Food/>}/>
                    <Route path=':food1/:food2' element={<Food/>}/>
                </Route>

                {/*<Route path='/about' element={<About/>}/>*/}
                <Route path='/about' element={<About/>}>
                    <Route path=':about1' element={<About/>}/>
                </Route>

                <Route path='/member/*' element={<Member/>}></Route>

                <Route path='/mycar/*' element={<MyCar/>}></Route>

                <Route path='/login/*' element={
                    <div>
                        <h2>login 메뉴 입니다</h2>
                        <img alt="" src={photo1}/>
                        <About/>
                    </div>
                }/>
            {/*    이외의 모든 매핑주소에 대한 처리 */}
                <Route path='*' element={
                    <div>
                        <h2>잘못된 페이지입니다</h2>
                        <img alt="" src={photo2}/>
                    </div>
                }/>
            </Routes>
        </div>
    );
};

export default RouterMain;