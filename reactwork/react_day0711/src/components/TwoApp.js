import { Alert } from '@mui/material';
import React, { useState } from 'react';
import TwoWriteForm from './TwoWriteForm';
import TwoRowItem from './TwoRowItem';

const TwoApp = () => {
    const [dataArray,setDataArray]=useState([
        {irum:'이영자',blood:'AB',age:34,today:new Date()},
        {irum:'강호동',blood:'A',age:23,today:new Date()},
        {irum:'유재석',blood:'O',age:43,today:new Date()}
    ]);

    //삭제 함수
    const deleteData=(idx)=>{
        setDataArray(dataArray.filter((d,i)=>i!==idx));
    }

    return (
        <div>
            <Alert>TwoApp-데이타 추가,삭제,출력(부모,자식컴포넌트)</Alert>
            {/* 입력폼 컴포넌트 */}
            <TwoWriteForm/>
            <hr/>
            <table className='table table-striped' style={{width:'450px'}}>
                <thead>
                <tr className='table-danger'>
                    <th style={{width:'50px'}}>번호</th>
                    <th style={{width:'80px'}}>이름</th>
                    <th style={{width:'60px'}}>나이</th>
                    <th style={{width:'70px'}}>혈액형</th>
                    <th style={{width:'100px'}}>등록일</th>
                    <th>삭제</th>
                </tr>
                </thead>
                <tbody>
                {
                    dataArray.map((row,idx)=>
                        <TwoRowItem key={idx} idx={idx} row={row} onDelete={deleteData}/>)
                }
                </tbody>
            </table>
        </div>
    );
};

export default TwoApp;