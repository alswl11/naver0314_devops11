import React, {useState} from 'react';
import {Alert, Switch} from "@mui/material";
import img1 from '../image/17.jpg';
import img2 from '../image/12.jpg';

const ThreeApp = () => {

    const [show, setShow] = useState(true);
    const [visible, setVisible] = useState('visible');
    const photoStyle = {
        width :'200px',
        height : '200px',
        border : '1px solid gray',
        borderRadius : '100px'
    }
    // checkbox event
    const photoCheckEvent = (e) => setShow(e.target.checked);
    // switch event
    const photoSwitchEvent = (e) => {
        setVisible(e.target.checked?"visible":"hidden");
    }

    return (
        <div>
            {/*<h3 className="alert alert-danger">ThreeApp</h3>*/}
            <Alert>ThreeApp</Alert>
            <Alert severity="info">이미지 show/hide 하는 여러방법</Alert>
            <label>
                <input type="checkbox" defaultValue onClick={photoCheckEvent}/> 사진1 보이기
            </label>
            <br/>
            {
                show &&
                <img alt="" src={img1} style={photoStyle}/>
            }
            <hr/>
            <Switch color="primary" defaultChecked onChange={photoSwitchEvent}/>
            <img alt="" src={img2} style={{width: '200px', visibility : visible}}/>
        </div>
    );
};

export default ThreeApp;