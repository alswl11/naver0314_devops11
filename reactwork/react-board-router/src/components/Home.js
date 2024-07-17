import React from 'react';
import {Alert} from "@mui/material";
import mainphoto1 from '../image/s4.JPG';
import mainphoto2 from '../image/s3.JPG';

const Home = () => {
    return (
        <div>
            <Alert>Home</Alert>
            <div style={{marginTop : "30px"}}>
                <img alt="" src={mainphoto1} style={{width:"200px" , height : "200px"}}/>
                <img alt="" src={mainphoto2} style={{width:"200px" , height : "200px"}}/>
            </div>
        </div>
    );
};

export default Home;