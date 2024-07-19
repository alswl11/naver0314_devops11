import React, {useEffect, useState} from 'react';
import {Alert} from "@mui/material";
import '../components/MyStyle.css';
import axios from "axios";
import {NavLink} from "react-router-dom";
import noimage from '../image/no.png';

const BoardList = () => {
    const [boardList, setBoardList] = useState([]);
    const getDataList=()=>{
        axios.get("/boot/board/list").then(res=>{
            setBoardList(res.data);
        });
    }

    const storage= process.env.REACT_APP_STORAGE;

    // 처음에 한번만 목록 가져오는 거임
    useEffect(() => {
        getDataList();
    }, []);

    return (
        <div style={{width : "600px"}}>
            <Alert><b>총 {boardList.length}개의 게시글이 있습니다.</b></Alert>
            <table className="table table-striped">
                <thead>
                <tr className="table-danger">
                    <th style={{width:"50px"}}>번호</th>
                    <th style={{width:"350px"}}>제목</th>
                    <th style={{width:"70px"}}>작성자</th>
                    <th style={{width:"100px"}}>작성일</th>
                    <th style={{width:"50px"}}>조회</th>
                </tr>
                </thead>
                <tbody>
                {
                    boardList.map((row, idx)=>
                        <tr key={idx}>
                            <td align="center">{boardList.length - idx}</td>
                            <td>
                                <NavLink to={`/board/detail/${row.boardnum}`}
                                         style={{textDecoration: "none", color: "black"}}>
                                    <img alt="" src={row.photo==='no'?noimage:`${storage}/${row.photo}`}
                                         style={{width: "40px", height: "40px", marginRight: "5px"}}/>
                                    {row.subject}
                                    &nbsp;
                                    {row.answercount>0?<span style={{color :"red"}}>[{row.answercount}]</span>:""}
                                </NavLink>
                            </td>
                            <td align="center">{row.writer}</td>
                            <td align="center"><span style={{fontSize: "14px"}}>{row.writeday.substring(0, 10)}</span></td>
                    <td align="center">{row.readcount}</td>

                        </tr>
                    )
                }
                </tbody>
            </table>

        </div>
    );
};

export default BoardList;