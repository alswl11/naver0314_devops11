import React, {useState} from 'react';
import {Alert, Button} from "@mui/material";
import Axios from "axios";

const MyCarWriteForm = ({onSave}) => {
    const [carname, setCarname] = useState("");
    const [carprice, setCarprice] = useState("");
    const [carcolor, setCarcolor] = useState("#ccffaa");
    const [carguip, setCarguip] = useState("");
    const [carphoto, setCarphoto] = useState("");

    // const photopath1= "https://s820wqj13737.edge.naverncp.com/vaFDWXnung/mycar/";
    // const photopath2= "?type=f&w=40&h=40&faceopt=true&ttype=jpg";

    const photopath =  "https://kr.object.ncloudstorage.com/bitcamp701-129/mycar"; // 스토리지 주소

    // 파일 업로드 이벤트
    const photoUploadEvent=(e)=>{
        const uploadFilename=e.target.files[0];
        const uploadForm=new FormData();
        uploadForm.append("upload",uploadFilename);
        Axios.post("/mycar/upload", uploadForm,{
            headers:{'Content-Type' : 'multipart/form-data'}
        }).then(res=>{
            setCarphoto(res.data.carphoto);
        });

    }


    // 등록 이벤트
    const addDataEvent=()=>{
        // 부모 컴포넌트의 onSave에 데이터 보내기
        onSave({carname, carphoto, carprice, carguip, carcolor});
        // 입력값 초기화
        setCarcolor("#ccffaa");
        setCarphoto("");
        setCarprice("");
        setCarname("");
        setCarguip("");
    }

    return (
        <div>
            <Alert color="error">자동차 등록하기</Alert>
            <table className="table table-bordered" style={{width: "500px"}}>
                <tbody>
                <tr>
                    <td className="table-success" style={{width: "100px"}}>자동차명</td>
                    <td style={{width: "200px"}}>
                        <input type="text" className="form-control" style={{width: "200px"}} value={carname}
                               onChange={(e) => setCarname(e.target.value)}/>
                    </td>
                    <td rowSpan={5} valign='middle'>
                        <img alt='' src={`${photopath}/${carphoto}`} style={{maxWidth: '200px'}}/>
                    </td>
                </tr>
                <tr>
                    <td className="table-success" style={{width: "100px"}}>사진</td>
                    <td>
                        <input type="file" className="form-control" style={{width: "200px"}} onChange={photoUploadEvent}/>
                    </td>
                </tr>
                <tr>
                    <td className="table-success" style={{width: "100px"}}>가격</td>
                    <td>
                        <input type="text" className="form-control" style={{width: "200px"}} value={carprice}
                               onChange={(e) => setCarprice(e.target.value)}/>
                    </td>
                </tr>
                <tr>
                    <td className="table-success" style={{width: "100px"}}>색상</td>
                    <td>
                        <input type="color" className="form-control" style={{width: "200px"}} value={carcolor}
                               onChange={(e) => setCarcolor(e.target.value)}/>
                    </td>
                </tr>
                <tr>
                    <td className="table-success" style={{width: "100px"}}>구입일</td>
                    <td>
                        <input type="date" className="form-control" style={{width: "200px"}} value={carguip}
                               onChange={(e) => setCarguip(e.target.value)}/>
                    </td>
                </tr>
                <tr>
                    <td colSpan={3} align="center">
                        <Button variant="contained" color="success" onClick={addDataEvent}>등록</Button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    );
};

export default MyCarWriteForm;