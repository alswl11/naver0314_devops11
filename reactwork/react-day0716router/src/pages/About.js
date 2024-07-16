import React from 'react';
import {Alert} from "@mui/material";
import {useParams} from "react-router-dom";
import noabout from '../image/s6.JPG';
import Samsung from '../image/1.jpg';
import Naver from '../image/3.jpg';

const About = () => {
    const {about1} = useParams();
    console.log({about1});
    return (
        <div>
            <Alert severity="info">About</Alert>
            <div>
                {
                    about1 == null ?
                        <div>
                            <h2>저는 아직 취업 준비중입니다</h2>
                            <img alt="" src={noabout}/>
                        </div> :
                        about1 === 'Samsung'?
                            <div>
                                <h2>저는 삼성을 다니고 있습니다.</h2>
                                <img alt="" src={Samsung} style={{width: "200px"}}/>
                            </div> :
                            about1 === 'Naver'?
                                <div>
                                    <h2>저는 네이버를 다니고 있습니다</h2>
                                    <img alt="" src={Naver} style={{width: "200px"}}/>
                                </div>:
                                <div>
                                    <h2>아무것도 아님</h2>
                                </div>
                }
            </div>
        </div>
    );
};

export default About;