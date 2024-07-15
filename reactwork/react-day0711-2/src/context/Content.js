import React, { useContext } from 'react';
import { ThemeContext } from './ThemeContext';
import { UserContext } from './UserContext';

const Content = () => {
    const {isDark}=useContext(ThemeContext);
    const myname=useContext(UserContext);

    return (
        <div className='content' style={{backgroundColor:isDark?'gray':'white'}}>
            <h1>{myname}님과 리액트 공부중...!</h1>
        </div>
    );
};

export default Content;