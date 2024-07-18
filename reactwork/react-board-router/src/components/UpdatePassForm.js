import { Button } from '@mui/material';
import axios from 'axios';
import React, { useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';

const UpdatePassForm = () => {
    const [pass,setPass]=useState('');
    const {boardnum}=useParams();
    const navi=useNavigate();

    const passCheckEvent=()=>{
        if(pass===''){
            alert('비밀번호를 입력해주세요');
            return;
        }

        let url=`/boot/board/updatecheckpass?boardnum=${boardnum}&pass=${pass}`;
        axios.get(url)
            .then(res=>{
                if(res.data.result==='success'){
                    navi(`/board/updateform/${boardnum}`);
                }else
                    window.alert("비밀번호가 맞지 않습니다");
            });
    }
    return (
        <div style={{margin:'30px 50px',width:'400px',height:'150px'}}>
            <h4><b>수정시 필요한 비밀번호를 입력해주세요</b></h4>
            <input type='password' className='form-control' autoFocus
                   style={{width:'200px',marginLeft:'50px'}} placeholder='비밀번호 입력'
                   value={pass} onChange={(e)=>setPass(e.target.value)}/>
            <br/>
            <Button variant='contained' color='success'
                    style={{marginLeft:'50px'}} onClick={passCheckEvent}>확인</Button>
            <Button variant='contained' color='success'
                    style={{marginLeft:'10px'}}
                    onClick={()=>window.history.back()}>취소</Button>
        </div>
    );
};

export default UpdatePassForm;