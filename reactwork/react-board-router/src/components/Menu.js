import React from 'react';
import {NavLink} from "react-router-dom";
import './MyStyle.css';

const Menu = () => {
    return (
        <ul className="main_menu">
            <li>
                <NavLink to={'/'}>Home</NavLink>
            </li>
            <li>
                <NavLink to={'/board/form'}>글쓰기</NavLink>
            </li>
            <li>
                <NavLink to={'/board/list'}>목록</NavLink>
            </li>
            <li>
                <NavLink to={'/post'}>카카오 주소</NavLink>
            </li>
            <li>
                <NavLink to={'/sweet'}>SweetAlert</NavLink>
            </li>
        </ul>
    );
};

export default Menu;