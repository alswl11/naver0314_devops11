import React from 'react';
import {Alert, Button} from "@mui/material";
import nofood from '../image/s10.JPG';
import {useParams} from "react-router-dom";

const Food = () => {
    // path의 파라미터 값 읽기
    const {food1, food2} = useParams();
    console.log({food1}, {food2});
    return (
        <div>
            <Alert severity="error">Food</Alert>
            <div style={{marginTop: "20px"}}>
                {
                    food1 == null && food2 == null ?
                        <div>
                            <h3>오늘은 점심을 안먹고 공부를 하겠습니다</h3>
                            <img alt="" src={nofood}/>
                        </div>
                        : food1 != null && food2 == null ?
                            <div>
                                <h2>오늘 저희 후식 메뉴는 한가지입니다</h2>
                                <img alt="" src={require(`../image/${food1}.jpg`)} style={{width: "200px"}}/>
                            </div>
                            : <div>
                                <h2>오늘 저의 점심메뉴입니다</h2>
                                <img alt="" src={require(`../image/${food1}.jpg`)} style={{width: "200px"}}/>
                                &nbsp; &nbsp;
                                <img alt="" src={require(`../image/${food2}.jpg`)} style={{width: "200px"}}/>
                            </div>
                }
            </div>
        </div>
    )
};

export default Food;