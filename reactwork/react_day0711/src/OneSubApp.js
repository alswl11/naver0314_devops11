import React from 'react';

const OneSubApp = ({idx, item}) => {
    return (

        <>
            <tr>
                <td style={{width: "200px"}} rowSpan={3} align="center">
                    <img alt="" src={require(`../image/${item.sphoto}`)}
                         style={{width: "120px", height: "130px", border: "1px solid gray"}}/>
                </td>
                <td>상품 번호 : {idx + 1}번</td>
            </tr>
            <tr>
                <td>상품명 : {item.sname}</td>
            </tr>
            <tr>
                <td>상품가격 : {item.sprice}</td>
            </tr>
            <tr>
                <td>상품색상 : <b style={{backgroundColor : item.scolor}}>{item.scolor}</b></td>
            </tr>
        </>
    );
};

export default OneSubApp;