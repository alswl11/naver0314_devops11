import React, {useState} from 'react';
import {Alert, Button} from "@mui/material";
import {DeleteForeverOutlined} from "@mui/icons-material";

const TwoApp = () => {
    const [names, setNames] = useState(["한가인", "캔디", "테리우스"]);
    const [irum, setIrum] = useState('');

    // 추가 이벤트
    const addNameEvent=()=>{
        if(irum.length===0){
            alert("추가할 이름을 입력해주세요");
            return;
        }

        // 입력한 이름을 배열변수 names에 추가
        setNames(names.concat(irum));
        setIrum('');
    }

    // 삭제하는 함수
    const deleteName=(idx)=>{
        let a = window.confirm(`${idx+1}번째 이름을 삭제하시겠습니까?`);
        if(a) {
            setNames(names.filter((n,i)=>i!==idx));
        }
    }
    return (
        <div>
            <Alert>TwoApp - 배열 삭제 추가 </Alert>
            <div className="input-group" style={{width : "300px"}}>
                <h5>이름 : </h5>
                <input type="text" className="form-control" style={{width : "130px"}} value={irum} onChange={(e)=>setIrum(e.target.value)}/>
                <Button variant="contained" color="success" onClick={addNameEvent}>추가</Button>
            </div>
            <hr/>
            {
                names.map((myname, idx) =>
                    <div className="input-group">
                        <h4 style={{width : '200px'}}>{myname}</h4>
                        <Button variant="outlined" color="info" onClick={()=> deleteName(idx)}>삭제</Button>
                    </div>
                )
            }
        </div>
)
;
};

export default TwoApp;