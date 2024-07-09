import React, {useEffect, useState} from 'react';
import {Build} from "@mui/icons-material";
import {Button} from "@mui/material";

const FiveApp = () => {
    const [number, setNumber] = useState(1);
    const [count, setCount] = useState(100);

    useEffect(() => {

    }, []);

    return (
        <div>
            <h3 className="alert alert-danger">FiveApp</h3>
            <b style={{fontSize: '30px', color: 'red'}}>Number : {number}</b>
            <br/>
            <Button variant="contained" color="success" onClick={()=>setNumber(number+1)}>Number 증가</Button> &nbsp;
            <Button variant="contained" color="success" onClick={()=>setNumber(number-1)}>Number 감소</Button>
            <hr/>
            <b style={{fontSize: '30px', color: 'red'}}>Count : {count}</b>
            <br/>
            <Button variant="contained" color="info" onClick={()=> setCount(count+10)}>Count 증가</Button> &nbsp;
            <Button variant="contained" color="info" onClick={()=> setCount(count-10)}>Count 감소</Button>
            <br/>
            <hr/>
            <Button variant="contained" color="secondary" onClick={()=> {
                setNumber(number+1);
                setCount(count+10);
            }}>모두 증가</Button> &nbsp;
            <Button variant="contained" color="secondary" onClick={()=> {
                setNumber(number-1);
                setCount(count-10);
            }}>모두 감소</Button>
        </div>
    );
};

export default FiveApp;