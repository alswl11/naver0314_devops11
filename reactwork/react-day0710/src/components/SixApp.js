import React, {useState} from 'react';
import {Alert} from "@mui/material";
import SixChildApp from "./SixChildApp";
import SixChild2App from "./SixChild2App";

const SixApp = () => {
    const [count, setCount] = useState(0);
    const [array, setArray] = useState([
        {cname : "아우디", cphoto :"20.jpg", cprice : '2300', color: "#afeeee"},
        {cname : "벤츠", cphoto :"17.jpg", cprice : '5000', color: "#bbb"},
        {cname : "제네시스", cphoto :"16.jpg", cprice : '330', color: "#fff"},
        {cname : "미니쿠퍼", cphoto :"11.jpg", cprice : '4000', color: "#40e0d0"}
    ])

    // 삭제하는 함수
    const deleteCar =(idx) =>{
        let a = window.confirm(`${idx+1}번째 자동차를 삭제하시겠습니까?`);
        if(a) {
            setArray(array.filter((n,i)=>i!==idx));
        }
    }
    // count 변경 이벤트
    const countIncre = () => setCount(count+1);
    return (
        <div>
            <Alert>SixApp - 부모자식간의 통신(2)</Alert>
            <Alert severity="error" style={{fontSize : '20px'}}>회원방문횟수 {count} </Alert>
            <SixChildApp carname = "아반떼" carphoto ="1.jpg" bgcolor="#ffc0cb" carprice = "3500"  onIncre={countIncre}/>
            <SixChildApp carname = "그랜져" carphoto ="2.jpg" bgcolor="#7fffd4" carprice = "4700" onIncre={countIncre}/>
            <hr style={{clear : "both"}}/>
            <table className="tbstyle">
                <thead>
                <tr style={{backgroundColor : "#f5f5dc"}}>
                    <th style={{width : "140px"}}>자동차명</th>
                    <th style={{width : "90px"}}>사진</th>
                    <th style={{width : "100px"}}>가격</th>
                    <th style={{width : "100px"}}>삭제</th>
                </tr>
                </thead>
                <tbody>
                {
                    array.map((item, idx)=><SixChild2App row={item} key={idx} idx={idx} onDelete={deleteCar}/>)
                }
                </tbody>
            </table>
        </div>
    );
};

export default SixApp;