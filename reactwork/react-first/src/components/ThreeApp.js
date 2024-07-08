import {useState} from "react";

const ThreeApp = () => {
    const [number, setNumber] = useState(0);
    const numberStyle = {
        fontSize : '40px',
        marginLeft : '100px',
        color : 'red',
        textShadow : '3px 3px 3px gray',
        marginBottom : '10px'
    }
    return(
        <div>
            <h1 className="alert alert-success">ThreeApp - 숫자 증가/감소 이벤트</h1>
            <div style={numberStyle}>{number}</div>
            <button type="button" className="btn btn-danger btn-sm" style={{marginLeft : '60px'}}>감소</button>
            <button type="button" className="btn btn-success btn-sm" style={{marginLeft : '10px'}}>증가</button>
        </div>
    )
}

export default ThreeApp;