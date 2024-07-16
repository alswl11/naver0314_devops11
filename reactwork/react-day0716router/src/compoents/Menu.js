import React from 'react';
import {NavLink} from "react-router-dom";

const Menu = () => {
    return (
        <div>
            <ul className="menu">
                <li>
                    <NavLink to={'/'}>Home</NavLink>
                </li>
                <li>
                    <NavLink to={'/food'}>Food #1</NavLink>
                </li>
                <li>
                    <NavLink to={'/food/11'}>Food #2</NavLink>
                </li>
                <li>
                    <NavLink to={'/food/2/4'}>Food #3</NavLink>
                </li>
                <li>
                    <NavLink to={'/about'}>About</NavLink>
                </li>
                <li>
                    <NavLink to={'/about/Samsung'}>About #2</NavLink>
                </li>
                <li>
                    <NavLink to={'/about/Naver'}>About #3</NavLink>
                </li>
                <li>
                    <NavLink to={'/Member'}>Member</NavLink>
                </li>
                <li>
                    <NavLink to={'/mycar/photo'}>MyCar</NavLink>
                </li>
            </ul>
        </div>
    );
};

export default Menu;