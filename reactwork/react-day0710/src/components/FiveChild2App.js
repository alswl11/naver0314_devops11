import React from 'react';
import './MyStyle.css';
const FiveChild2App = ({photo, msg}) => {
    return (
        <div className="box1">
            <img alt="" src={require(`../people/${photo}`)} className="small"/>
            <b>{msg}</b>
        </div>
    );
};

export default FiveChild2App;