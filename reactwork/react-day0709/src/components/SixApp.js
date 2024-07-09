import React from 'react';
import img1 from '../food/1.jpg';
import img2 from '../food/2.jpg';
import img3 from '../food/3.jpg';
import img4 from '../food/4.jpg';
import './MyStyle.css';

const SixApp = () => {
    const names = ["장미꼴", "안개꽃", "다알리아", "목수국", "체송화"];
    const photos = [img1, img2, img3, img4];

    // 방법 1
    // const nameList = names.map(function (item, index) {
    //     return <li>{index} : {item}</li>
    // })

    // 위의 코드를 화살표 함수로 변경해보세요
    const nameList =names.map((item, index) => <li key={index}>{index} : {item}</li>)
    return (
        <div>
            <h3 className="alert alert-danger">SixApp - map 반복문</h3>
            <h5>미리 변수에 저장 후 출력 #1</h5>
            <ul>{nameList}</ul>
            <hr/>
            <h5>직접 map으로 반복하기 #2</h5>
            {
                names.map((item, index) => <h5 key={index}>{index} : {item}</h5>)
            }
            <hr/>
            <h5>이미지 배열 출력하기 #3</h5>
            {
                photos.map((photo, index) => <img key={index} alt="" src={photo} className='photo'/>)
            }
        </div>
    );
};

export default SixApp;