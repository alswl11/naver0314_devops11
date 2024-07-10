import React from 'react';
import {Alert} from "@mui/material";

const EightApp = () => {
    const personArray = [
        {pname: "전지현", photo: "8.jpg", addr: "제주도 애월읍", age: 45},
        {pname: "설현", photo: "15.jpg", addr: "부산 해운대구", age: 26},
        {pname: "신민아", photo: "17.jpg", addr: "서울시 강남구", age: 31},
        {pname: "수지", photo: "19.jpg", addr: "서울시 여의도", age: 29},
        {pname: "강동원", photo: "9.jpg", addr: "경기도 용인시", age: 41},
    ]
    return (
        <div>
            <Alert>EightApp</Alert>
            {/*    번호 | 사진 (class smallphoto) | 이름 | 나이 | 주소 순으로 출력     */}
            <table className="table table-bordered" style={{width: '400px'}}>
                <thead>
                <tr className="table-danger">
                    <th style={{width: '50px'}}>번호</th>
                    <th style={{width: '70px'}}>사진</th>
                    <th style={{width: '80px'}}>이름</th>
                    <th style={{width: '70px'}}>나이</th>
                    <th>주소</th>
                </tr>
                </thead>
                <tbody>
                {
                    personArray.map((person, idx) =>
                        <tr key={idx}>
                            <td align="center">{idx + 1}</td>
                            <td align="center"><img align="" className="smallphoto" src={require(`../image/${person.photo}`)}/></td>
                            <td>{person.pname}</td>
                            <td>{person.age}세</td>
                            <td>{person.addr}</td>
                        </tr>)
                }
                </tbody>
            </table>
        </div>
    );
};

export default EightApp;