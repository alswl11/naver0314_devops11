import React from 'react';
import './MyStyle.css';
const FiveChildApp = (props) => {
    return (
        <div className="box1">
            이름 : {props.irum},
            나이 : {props.age},
            주소 : {props.addr}
        </div>
    );
};

export default FiveChildApp;