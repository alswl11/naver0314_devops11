import React from 'react';
import './MyStyle.css';
import {Button} from "@mui/material";
const SixChild2App = ({row, onDelete, idx}) => {
    return (
        <tr style={{backgroundColor : row.color}}>
            <td>{row.cname}</td>
            <td><img alt="" src={require(`../people/${row.cphoto}`)} className="small"/></td>
            <td>{row.cprice}만원</td>
            <td align="center"><Button size="small" color="error" variant="contained" onClick={()=>onDelete(idx)}>삭제하기</Button></td>
        </tr>
    );
};

export default SixChild2App;