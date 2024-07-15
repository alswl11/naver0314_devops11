import { Alert } from '@mui/material';
import React, { useRef } from 'react';
import cate from '../data/CateData.json';
import './MyStyle.css';
import errorImg from '../image/1.jpg';

const ThreeApp = () => {
    //json 데이타 가져오기
    const navData=cate.navData;
    const categoryData=cate.categoryData;

    //이미지 ref
    const mainPhotoRef=useRef(null);

    return (
        <div>
            <Alert>ThreeApp-json 데이타 출력</Alert>
            <div className='nav_container'>
                <ul className='nav_category'>
                    {
                        navData.map((item,i)=>
                            <li key={i}>
                                <div>
                                    <img alt=""
                                         className='imgcategory'
                                         src={item.img}
                                         onClick={(e)=>mainPhotoRef.current.src=e.target.src}/>
                                </div>
                                <div>
                                    {item.title}
                                </div>
                            </li>)
                    }
                </ul>
            </div>

            <div className='nav_container'>
                <ul className='nav_category'>
                    {
                        categoryData.map((item,i)=>
                            <li key={i}>
                                <div>
                                    <img alt=""
                                         className='imgcategory'
                                         src={item.img}
                                         onMouseOver={(e)=>mainPhotoRef.current.src=e.target.src}/>
                                </div>
                                <div>
                                    {item.title}
                                </div>
                            </li>)
                    }
                </ul>
            </div>
            {/* 아이콘 클릭시 작은 이미지를 가져와서 출력할 메인 이미지-ref를 이용 */}
            <div>
                <img alt='' src={errorImg}
                     style={{width:'300px',height:'300px',
                         border:'5px inset gray',
                         margin:'10px 200px'}}
                     onError={(e)=>e.target.src=errorImg}
                     ref={mainPhotoRef}/>
            </div>
        </div>
    );
};

export default ThreeApp;