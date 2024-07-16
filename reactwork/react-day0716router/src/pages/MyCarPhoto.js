import React, {useEffect, useState} from 'react';
import axios from "axios";
import ImageList from '@mui/material/ImageList';
import ImageListItem from '@mui/material/ImageListItem';
import ImageListItemBar from '@mui/material/ImageListItemBar';


const MyCarPhoto = () => {

    const [list, setList]=useState([]);
    const storage = "https://kr.object.ncloudstorage.com/bitcamp701-129/mycar";
    const dataList=()=>{
        axios.get("/mycar/list").then(res=>{
            setList(res.data);
        })
    }

    useEffect(() => {
        dataList();
    }, []);
    return (
        <ImageList sx={{ width: 500, height: 450 }}>
            {list.map((item) => (
                <ImageListItem key={item.img}>
                    <img
                        srcSet={`${storage}/${item.carphoto}?w=248&fit=crop&auto=format&dpr=2 2x`}
                        src={`${storage}/${item.carphoto}?w=248&fit=crop&auto=format`}
                        alt={item.carname}
                        loading="lazy"
                    />
                    <ImageListItemBar
                        title={item.carname}
                        subtitle={<span style={{fontSize : "15px"}}>Price: {item.carprice}만원</span>}
                        position="below"
                    />
                </ImageListItem>
            ))}
        </ImageList>
    );
};

export default MyCarPhoto;