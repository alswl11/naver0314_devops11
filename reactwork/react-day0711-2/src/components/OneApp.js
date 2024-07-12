import React, {useState} from 'react';
import {Alert, Button} from "@mui/material";
import OneSubApp from "./OneSubApp";

const OneApp = () => {
    const [inputArray, setInputArray] = useState([
        {sname : "신상슈즈", scolor : "orange", sprice : 23000, sphoto :"15.jpg"}
    ]);
    const [inputs, setInputs] = useState({
        sname : "",
        sphoto : "",
        sprice : 0,
        scolor : "#ffccff"
    });

    // 각 입력태그에서 호출할 이벤트
    const changeDataEvent=(e)=>{
        let {name, value} = e.target;

        setInputs({
            ...inputs,
            [name] : value
        })
    }
    // 상품 추가 버튼 이벤트
    const addSangpumEvent=()=>{
        setInputArray(inputArray.concat(inputs));
    }
    // 입력값 초기화 버튼 이벤트
    const initDataEvent=()=>{
        setInputs({
            sname: "",
            sphoto: "14.jpg",
            sprice: 0,
            scolor: "#ffccff"
        });
    }
    // 삭제함수
    const deleteSangpum=(idx)=>{
        setInputArray(inputArray.filter((d, i)=>i!==idx));
    }
    return (
        <div>
            <Alert>OneApp-모든 입력값 하나의 변수에 넣기</Alert>
            <table className="table table-bordered" style={{width : "300px"}}>
                <tbody>
                <tr>
                    <th style={{backgroundColor: "#ccf", width: "100px"}}>상품명</th>
                    <td>
                        <input type="text" className="form-controller" value={inputs.sname} name="sname"
                               onChange={changeDataEvent}/>
                    </td>
                </tr>
                <tr>
                    <th style={{backgroundColor: "#ccf", width: "100px"}}>색상</th>
                    <td>
                        <input type="color" className="form-controller" value={inputs.scolor} name="scolor"
                               onChange={changeDataEvent}/>
                    </td>
                </tr>
                <tr>
                    <th style={{backgroundColor: "#ccf", width: "100px"}}>가격</th>
                    <td>
                        <input type="text" className="form-controller" value={inputs.sprice} name="sprice"
                               onChange={changeDataEvent}/>
                    </td>
                </tr>
                <tr>
                    <th style={{backgroundColor: "#ccf", width: "100px"}}>사진</th>
                    <td>
                        <select className="form-select" name="sphoto" onChange={changeDataEvent}>
                            <option value={"14.jpg"}>플렛슈즈</option>
                            <option value={"23.jpg"}>여름용모자</option>
                            <option value={"30.jpg"}>보석머리띠</option>
                            <option value={"32.jpg"}>투피스</option>
                            <option value={"31.jpg"}>자켓</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colSpan={2} align="center">
                        <Button variant="contained" color="success" size="small" onClick={addSangpumEvent}>상품 추가</Button>
                        &nbsp;&nbsp;
                        <Button variant="contained" color="success" size="small" onClick={initDataEvent}>입력값초기화</Button>
                    </td>
                </tr>
                </tbody>
            </table>
            <h4>총 {inputArray.length}개의 배열 데이터가 있습니다</h4>
            <table className="table table-bordered" style={{width : "400px"}}>
                <tbody>
                {
                    inputArray.map((item,idx)=>
                    <OneSubApp key={idx} idx={idx} item={item} deleteSangpum={{deleteSangpum}}/>)
                }
                </tbody>
            </table>
        </div>
    );
};

export default OneApp;