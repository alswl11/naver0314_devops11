/*
axios 는 현재 커뮤니티에서 가장 많이 사용하는 http 통신 라이브러리이다
엑시오스는 Promise 기반의 API 형식이 다양하게 제공되어 별도의 로직을 구현할 필요없이 API 만으로도 간편하게 원하는 로직을 구현할수 있다
(Promise 란? 서버에 데이타를 요청하여 받아오는 동작과 같은 비동기 로직 처리에 유용한 자바스크립트 객체이다)
//Http Get요청
axios.get(‘url주소’).then().catch();
//http post 요청**
axios.post(‘url주소’).then().catch();
//http 요청에 대한 옵션 속성 정의
axios({
method:’get’,
url:’url 주소’,
….
});
*/

import { Alert } from '@mui/material';
import Axios from 'axios';
import React, { useEffect, useState } from 'react';
import FiveRowItem from './FiveRowItem';

const FiveApp = () => {
    const [mycarlist,setMyCarList]=useState([]);

    //백엔드에서 mycar 목록을 가져온다
    const list=()=>{
        //package.json 에 "proxy": "http://localhost:9000" 추가시 url 에 생략함
        Axios.get("/mycar/list")
            .then(res=>{
                setMyCarList(res.data);
            });
    }

    //처음 로딩시 목록 가져오기
    useEffect(()=>{
        list();
    },[]);//처음 한번만 호출

    return (
        <div>
            <Alert>FiveApp-Axios db데이타가져오기</Alert>
            <Alert severity='info'>총 {mycarlist.length}개의 자동차정보가 있습니다</Alert>
            <table className='table table-bordered' style={{width:'400px'}}>
                <tbody>
                {
                    mycarlist.map((mycar,idx)=>
                        <FiveRowItem mycar={mycar} key={idx}/>)
                }
                </tbody>
            </table>
        </div>
    );
};

export default FiveApp;