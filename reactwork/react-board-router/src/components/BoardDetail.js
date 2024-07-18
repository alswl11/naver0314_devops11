import React, {useEffect, useState} from 'react';
import {redirect, useNavigate, useParams} from "react-router-dom";
import axios from "axios";
import {Button} from "@mui/material";
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';

const BoardDetail = () => {
    const {boardnum} = useParams();
    const [selectData, setSelectData] = useState({});
    const storage = process.env.REACT_APP_STORAGE;
    const navi = useNavigate();

    const [open, setOpen] = React.useState(false);

    const handleClickOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    const [pass, setPass] = useState('');

    const getData = () => {
        let url = "/boot/board/detail?boardnum=" + boardnum;
        axios.get(url).then(res => {
            setSelectData(res.data);
        })
    }

    useEffect(() => {
        getData();
    }, []);


    return (
        <div style={{width: "500px", marginLeft: "30px"}}>
            <table className="table">
                <caption align="top"><h3><b>게시글 상세보기</b></h3></caption>
                <tbody>
                <tr>
                    <td>
                        <h3><b>{selectData.subject}</b></h3>
                        <b>{selectData.writer}</b>
                        <span style={{float: "right", color: "gray", fontSize: "14px"}}>
                            조회 &nbsp;{selectData.readcount}
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            {selectData.writeday}
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        {
                            selectData.photo !== 'no' ?
                                <div>
                                    <h3><b>대표사진</b></h3>
                                    <img alt='' src={`${storage}/${selectData.photo}`} style={{maxWidth: "200px"}}/>
                                    <hr/>
                                </div> : ""
                        }
                        <pre dangerouslySetInnerHTML={{__html: selectData.content}}></pre>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <Button variant="outlined" color="success" size="samll" style={{width: "80px"}}
                                onClick={() => navi("/board/list")}>목록</Button>
                        &nbsp;&nbsp;
                        <Button variant="outlined" color="success" size="samll" style={{width: "80px"}}
                                onClick={() => navi("/board/form")}>글쓰기</Button>
                        &nbsp;&nbsp;
                        <Button variant="outlined" color="success" size="samll" style={{width: "80px"}}
                                onClick={()=>navi(`/board/updatepass/${boardnum}`)}>글 수정</Button>
                        &nbsp;&nbsp;
                        <Button variant="outlined" color="success" size="samll" style={{width: "80px"}}
                                onClick={handleClickOpen}>삭제</Button>

                        {/*    삭제 비밀번호 입력 dialog */}
                        <Dialog
                            open={open}
                            onClose={handleClose}
                            PaperProps={{
                                component: 'form',
                                onSubmit: (event) => {
                                    event.preventDefault();
                                    // alert(pass);
                                    let url = `/boot/board/deletecheckpass?boardnum=${boardnum}&pass=${pass}`;
                                    axios.get(url).then(res => {
                                        if(res.data.result==='success'){
                                            alert("삭제되었습니다.");
                                            navi("/board/list");
                                        } else {
                                            window.alert("비밀번호가 맞지 않습니다.");
                                        }
                                    });
                                    handleClose();
                                },
                            }}
                        >
                            <DialogTitle>삭제 확인</DialogTitle>
                            <DialogContent>
                                <DialogContentText>
                                    삭제하기 전 비밀번호를 입력해주세요.
                                </DialogContentText>
                                <TextField
                                    autoFocus
                                    required
                                    margin="dense"
                                    id="standard-password-input"
                                    label="password"
                                    type="password"
                                    autoComplete="current-password"
                                    variant="standard"
                                    onChange={(e) => setPass(e.target.value)}
                                />
                            </DialogContent>
                            <DialogActions>
                                <Button onClick={handleClose}>취소</Button>
                                <Button type="submit">삭제하기</Button>
                            </DialogActions>
                        </Dialog>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    );
};

export default BoardDetail;