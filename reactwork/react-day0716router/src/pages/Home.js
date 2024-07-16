import React from 'react';
import {Alert, Button} from "@mui/material";
import {useNavigate} from "react-router-dom";

const Home = () => {
    const navi = useNavigate();
    return (
        <div>
            <Alert severity="success">Home</Alert>
            <h3>페이지 이동 연습</h3>
            <Button variant="contained" size="small" color="error" onClick={()=>navi('/about')}>About 페이지로 이동</Button>
            <br/><br/>
            <Button variant="contained" size="small" color="success"onClick={()=>navi('/mycar/list')}>MyCar 페이지로 이동</Button>
            <br/><br/>
            <Button variant="contained" size="small" color="info" onClick={()=>navi('/member/moim1')}>Member 페이지로 이동</Button>
        </div>
    );
};

export default Home;