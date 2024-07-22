import React, {useMemo} from 'react';


const getNumber=(number)=>{
    console.log("숫자가 변동되었습니다");
    return number;
}
const getText=(text)=>{
    console.log("글자가 변동되었습니다.");
    return text;
}
const ShowState = ({number, text}) => {
    // const showNumber = getNumber(number);
    // const showText = getText(text);

    // 위의 코드를 랜더링 최적화를 시켜보자
    const showNumber = useMemo(()=>getNumber(number), [number]);
    const showText = useMemo(()=>getText(text), [text]);
    return (
        <div>
            {showNumber}<br/>{showText}
        </div>
    );
};

export default ShowState;