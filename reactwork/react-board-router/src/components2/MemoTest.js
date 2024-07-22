import React, {useState} from 'react';
import {Alert, Button} from "@mui/material";
import ShowState from "./ShowState";

//  useMemo : memoization : 랜더링을 최적화하기 위한 기능

const MemoTest = () => {
    const [number, setNumber] = useState(0);
    const [text, setText] = useState('');

    const increNumber=()=>{
        setNumber(number+1);
    }
    const decreNumber=()=>{
        setNumber(number-1);
    }
    const onChangeTextHandler = (e)=>{
        setText(e.target.value);
    }
    return (
        <div style={{fontSize : "2em", margin:"100px 100px"}}>
            {/*<Alert>Memo Test</Alert>*/}
            <div>
                <Button variant="contained" color="success" onClick={increNumber}>+</Button>&nbsp;
                <Button variant="contained" color="success" onClick={decreNumber}>-</Button>&nbsp;
                <br/>
                <input type="text" placeholder="Last Name?" value={text} onChange={onChangeTextHandler}/>
            </div>
            <ShowState number={number} text={text}></ShowState>
        </div>
    );
};

export default MemoTest;