import React from 'react';
import {Button} from "@mui/material";
import './MyStyle.css';
const SixChildApp = (props) => {
    let {carname, carphoto, carprice, onIncre, bgcolor} = props;
    return (
        <div className="box2" style={{backgroundColor : bgcolor}}>
            자동차명 : {carname}<br/>
            가격 : {carprice}만원 <br/>
            사진 <br/>
            <img alt="" src={require(`../people/${carphoto}`)} className="small2"/><br/>
            <Button variant="outlined" color="error" size="small" onClick={onIncre}>방문</Button>
        </div>
    );
};

export default SixChildApp;