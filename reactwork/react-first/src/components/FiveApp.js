import React, {useState} from 'react';
import car1 from '../mycar5.png';

const FiveApp = () => {
    const [show, setShow] = useState(true);
    const [fname, setFname] = useState('Gamja Flower');
    const [fcolor, setFcolor] = useState('red');
    const [bcolor, setBcolor] = useState('#afeeee');

    let message = "오늘은 리액트를 공부중입니다";

    return (
        <div>
            <h1 className="alert alert-danger">FiveApp - 글꼴 변경</h1>
            <button type="button" className="btn btn-sm btn-info" onClick={() => setShow(!show)}>show/hid</button>
            {
                show && <img align="car" src={car1} style={{width: '200px'}}/>
            }
            <hr/>
            <div style={{fontStyle: '30px', color: fcolor, fontFamily: fname, paddingBottom: '15px', backgroundColor : bcolor}}>{message}</div>
            <h5>select 이벤트를 이용해서 글꼴 변경하기</h5>
            <div className="input-group" style={{width: '300px'}}>
                <select className="form-select" style={{width: '120px'}} onChange={(e) => setFname(e.target.value)}>
                    <option>East Sea Dokdo</option>
                    <option>Jua</option>
                    <option>Gaegu</option>
                    <option selected>Gamja Flower</option>
                    <option>Single Day</option>
                </select>
                &nbsp;&nbsp;
                <select className="form-select" style={{width: '120px'}} onChange={(e) => setFcolor(e.target.value)}>
                    <option selected>Red</option>
                    <option>Orange</option>
                    <option>Yellow</option>
                    <option>Green</option>
                    <option>Blue</option>
                </select>
                <br/>
                &nbsp;&nbsp;
                <label>
                    <input type="radio" defaultValue='#afeeee' name="bclor" defaultChecked onClick={(e) => setBcolor(e.target.value)}/>하늘색
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type="radio" defaultValue='#fffacd' name="bclor" onClick={(e) => setBcolor(e.target.value)}/>노랑색
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type="radio" defaultValue='#90ee90' name="bclor" onClick={(e) => setBcolor(e.target.value)}/>초록색
                </label>

            </div>
        </div>
    );
};

export default FiveApp;
