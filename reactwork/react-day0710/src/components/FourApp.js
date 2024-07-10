import React, {useRef, useState} from 'react';
import {Alert, Button} from "@mui/material";

const FourApp = () => {
    const [result, setResult]=useState("");
    const nameRef = useRef("");
    const korRef = useRef(0);
    const engRef = useRef(0);

    // 버튼 이벤트
    const resultBtnEvent = () =>{
        // 입력값 읽기
        let name = nameRef.current.value;
        let kor = korRef.current.value;
        let eng = engRef.current.value;
        // 총점, 평균
        let tot = Number(kor) + Number(eng);
        let avg = tot/2;

        let s = `이름 : ${name} \n 국어점수 : ${kor} \n 영어점수 : ${eng} \n 총점 ${tot} \n 평균 : ${avg}`;
        setResult(s);
        // 입력 초기화
        nameRef.current.value= "";
        korRef.current.value="";
        engRef.current.value="";
        nameRef.current.focus();
    }

    return (
        <div>
            <Alert>FourApp - useRef 응용예제</Alert>
            <table className="table table-bordered" style={{width : '300px'}}>
                <tbody>
                <tr>
                    <th style={{width: '100px'}} className="table-info">이름</th>
                    <td>
                        <input type="text" className="form-control" ref={nameRef}/>
                    </td>
                </tr>
                <tr>
                    <th style={{width: '100px'}} className="table-info">국어점수</th>
                    <td>
                        <input type="text" className="form-control" ref={korRef}/>
                    </td>
                </tr>
                <tr>
                    <th style={{width: '100px'}} className="table-info">영어점수</th>
                    <td>
                        <input type="text" className="form-control" ref={engRef}/>
                    </td>
                </tr>
                <tr>
                    <td colSpan={2} align="center">
                        <Button variant="contained" color="error" onClick={resultBtnEvent}>결과 출력하기</Button>
                    </td>
                </tr>
                <tr style={{height : '100px'}}>
                    <td colSpan={2} style={{fontSize : '16px', whiteSpace : 'pre-line' , backgroundColor : '#ffc'}}>
                        {result}
                    </td>
                </tr>
                </tbody>

            </table>

        </div>
    );
};

export default FourApp;