import React, {useEffect, useState} from 'react';
import {Alert} from "@mui/material";
import axios from "axios";

const MemberList = () => {
    const [memberList,setMemberList]=useState([]);

    const getMemberList=()=>{
        axios.get("/boot/member/list")
            .then(res=>{
                setMemberList(res.data);
            })
    }

    useEffect(()=>{
        getMemberList();
    },[]);
    return (
        <table className='table table-bordered'
               style={{width: '500px', margin: '30px 100px'}}>
            <caption align="top"><h5><b>[회원 목록]</b></h5></caption>
            <thead>
            <tr className='table-danger'>
                <th style={{width: '50px'}}>번호</th>
                <th style={{width: '120px'}}>아이디</th>
                <th style={{width: '150px'}}>핸드폰</th>
                <th>가입일</th>
            </tr>
            </thead>
            <tbody>
            {
                memberList &&
                memberList.map((mem, idx) =>
                    <tr key={idx}>
                        <td>{idx + 1}</td>
                        <td>{mem.userid}</td>
                        <td>{mem.hp}</td>
                        <td>{mem.gaipday}</td>
                    </tr>)
            }
            </tbody>
        </table>
    );
};

export default MemberList;