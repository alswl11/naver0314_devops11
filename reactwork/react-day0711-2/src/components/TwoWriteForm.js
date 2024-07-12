import React, {useState} from 'react';

const TwoWriteForm = (onSave) => {
    const [irum, setIrum]=useState("");
    const [age, setAge] = useState("");
    const [blood, setBlood] = useState("A");

    // 추가 이벤트
    const addDataEvent=(e)=>{
        onSave({irum,age,blood});
        //초기화
        setIrum("");
        setAge("");
    }

    return (
        <div className="input-group" style={{width: "450px"}}>
            <h6>이름</h6>
            <input type="text" className="form-control" style={{width: "80px"}} value={irum} onChange={(e) => setIrum(e.target.value)}/>
            <h6>나이</h6>
            <input type="text" className="form-control" style={{width: "50px"}} value={age}onChange={(e) => setAge(e.target.value)}/>
            <h6>혈액형</h6>
            <select className="form-select" onChange={(e)=>setBlood(e.target.value)}>
                <option>A</option>
                <option>B</option>
                <option>0</option>
                <option>AB</option>
            </select>
            <button type='button' className='btn btn-sm btn-success'
                    onClick={addDataEvent}>
                추가
            </button>
        </div>
    );
};

export default TwoWriteForm;