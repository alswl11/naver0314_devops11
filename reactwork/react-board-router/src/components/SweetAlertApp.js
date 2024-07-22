import React, {useState} from 'react';
import {Alert, Button} from "@mui/material";
import Swal from "sweetalert2";
import xmas1 from '../image/santa.gif';
import tree1 from '../image/tree1.gif';
import tree2 from '../image/tree2.gif';
import tree3 from '../image/tree3.gif';
import bell1 from '../image/bell1.gif';

const SweetAlertApp = () => {

    const [sangpum, setSangpm] = useState("애플워치");

    const buttonEvent1 = () => {
        Swal.fire('안녕하세요');
    }
    const buttonEvent2 = () => {
        Swal.fire({
            title: "SWAL TEST #2",
            html: "줄바꿈을 해볼까요 <br/> html로 하면 바뀌지롱",
            icon: "info",
            confirmButtonColor: "orange",
            confirmButtonText: "확인",
            showCancelButton: true,
            cancelButtonColor: "skyblue",
            cancelButtonText: "취소"
        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire("처리했습니다");
            } else {
                Swal.fire("취소했습니다");
            }
        });
    }
    const buttonEvent3 = () => {
        Swal.fire({
            title: "사진 넣기",
            html: `<h5>사진을 넣어보세요</h5><img alt="" src=${tree1}>`,
            imageUrl: xmas1,
            // imageHeight : 60 // width 도 마찬가지로 줄 수 있음
            icon: "success"
        })
    }
    const buttonEvent4 = () => {
        Swal.fire({
            title: "Input Email Address",
            input: "email",
            inputLabel: "Your Email Address",
            inputPlaceholder: "Enter your email address",
            showCancelButton: true,
            cancelButtonText: "취소"
        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire("확인되었습니다.");
            } else {
                Swal.fire("취소되었습니다");
            }
        })

    }
    const buttonEvent5 = () => {
        Swal.fire({
            title: "상품구매",
            imageUrl: '../line.gif',
            html: `[${sangpum}] 상품을 구매하시겠습니까?`,
            showCancelButton: true,
            cancelButtonText: "취소"
        }).then(result => {
            if (result.isConfirmed) {
                Swal.fire(`[${sangpum}] 상품을 결재했습니다`);
            }
        })
    }

    const buttonEvent6 = () => {
        let arr = [
            {photo: tree1, msg: "candy"},
            {photo: tree2, msg: "mickle"},
            {photo: tree3, msg: "banana"},
            {photo: bell1, msg: "orange"}
        ]

        let s = "";
        for (let a of arr) {
            s += `<img alt="" src=${a.photo} width="60"/>&nbsp;&nbsp;<b>${a.msg}</b><br/>`;
        }
        Swal.fire({
            icon : "success",
            title : "좋아요 누른 사람",
            imageUrl : xmas1,
            html : s
        })
    }
    return (
        <div>
            <Alert>SweetAlert 공부하기</Alert>
            <Button variant="contained" color="error" size="small" onClick={buttonEvent1}>SweetAlert #1</Button>
            <br/><br/>
            <Button variant="contained" color="error" size="small" onClick={buttonEvent2}>SweetAlert #2</Button>
            <br/><br/>
            <Button variant="contained" color="error" size="small" onClick={buttonEvent3}>SweetAlert #3</Button>
            <br/><br/>
            <Button variant="contained" color="error" size="small" onClick={buttonEvent4}>SweetAlert #4</Button>
            <br/><br/>
            <Button variant="contained" color="error" size="small" onClick={buttonEvent5}>SweetAlert #5</Button>
            <br/><br/>
            <Button variant="contained" color="error" size="small" onClick={buttonEvent6}>SweetAlert #6</Button>
        </div>
    );
};

export default SweetAlertApp;