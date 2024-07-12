import React from 'react';
import {Button} from "@mui/material";

const TwoRowItem = (props) => {
    let {idx, row, onDelete}=props;
    return (
        <tr>
            <td>{idx+1}</td>
            <td>{row.irum}</td>
            <td>{row.age}세</td>
            <td>{row.blood}형</td>
            <td>{row.today.toLocaleString('ko-KR')}</td>
            <td>
                <Button size="small" variant="outlined" color="error" onClick={()=>{
                    let a = window.confirm("해당멤버를 삭제할까요?");
                    if(a) {
                        onDelete(idx);
                    }
                }}>
                   삭제
                </Button>
            </td>
        </tr>
    );
};

export default TwoRowItem;