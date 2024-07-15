import React, {useEffect, useState} from 'react';
import Axios from "axios";
import {Alert, Button} from "@mui/material";
import MyCarRowItem from "./MyCarRowItem";
import MyCarWriteForm from "./MyCarWriteForm";
import axios from 'axios';


const MyCarList = () => {
    const [list, setList]=useState([]);
    const [show, setShow] = useState(true);
    const myCarList=()=>{
        Axios.get("/mycar/list").then(res=>setList(res.data));

    }

    // 처음 시작 시 목록 가져오기 : 한번만 호출되게
    useEffect(() => {
        myCarList();
    }, []);

    // 자동차 등록 이벤트
    const addMycarEvent=(data)=>{
        console.log(data);
        axios.post("/mycar/insert",data)
            .then(res=>{
                myCarList();
            })
    }

    const deleteMyCar=(num)=>{
        Axios.delete("/mycar/delete?num="+num).then(res=>{
            myCarList();
        })
    }

    // 수정
    const updateMycar = (data) =>{
        Axios.post("/mycar/update", data).then(res=>{
            // 수정 성공 후 목록 다시 출력
            myCarList();
        })
    }

    return (
        <div>
            <Button variant="contained" color="info" onClick={()=>setShow(!show)}>자동차 등록 show/hide</Button>
            {
                show &&
                <MyCarWriteForm onSave={addMycarEvent}/>
            }
            <Alert severity="success" style={{fontSize : "15px" , width :"600px"}}>
                <b>총 {list.length}개의 자동차 정보가 있습니다. </b>
            </Alert>
            <table className="table table-bordered" style={{width : "600px"}}>
                <thead>
                <tr className="table-danger">
                    <th style={{width : "160px"}}>자동차명</th>
                    <th style={{width : "110px"}}>가격</th>
                    <th style={{width : "60px"}}>색상</th>
                    <th style={{width : "100px"}}>구입일</th>
                    <th style={{width : "170px"}}>등록일</th>
                </tr>
                </thead>
                <tbody>
                {
                    list.map((row, idx)=>
                    <MyCarRowItem key={idx} idx={idx} row={row} onDelete={deleteMyCar} onUpdate={updateMycar}/>
                    )
                }
                </tbody>
            </table>
        </div>
    );
};

export default MyCarList;