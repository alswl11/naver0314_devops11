import React, {useEffect, useState} from 'react';
import {NavLink, useNavigate, useParams} from "react-router-dom";
import axios from "axios";
import {Button} from "@mui/material";
import TextField from '@mui/material/TextField';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogContentText from '@mui/material/DialogContentText';
import DialogTitle from '@mui/material/DialogTitle';
import {EditNote, HighlightOff, UpdateTwoTone} from "@mui/icons-material";

const BoardDetail = () => {
    const {boardnum} = useParams();
    const [selectData, setSelectData] = useState({});
    const [nickname, setNickname] = useState('');
    const [comment, setComment] = useState('');
    const [commentList, setCommentList] = useState([]);

    //댓글 입력 후 엔터 이벤트
    const addCommentEvent = () => {
        alert("comment");
        if (nickname === '') {
            alert("닉네임을 입력해주세요");
            return;
        }

        if (comment === '') {
            alert("코멘트를 입력해주세요");
            return;
        }

        axios.post("/boot/comment/insert", {boardnum, nickname, comment})
            .then(res => {
                commentListEvent();//댓글 다시 출력
                //입력값 초기화
                setNickname('');
                setComment('');
            });
    }

    //댓글 출력 함수
    const commentListEvent = () => {
        axios.get(`/boot/comment/list?boardnum=${boardnum}`)
            .then(res => {
                setCommentList(res.data);
            })
    }

    //댓글 삭제 함수
    const deleteComment = (idx) => {
        let url = `/boot/comment/delete?idx=${idx}`;
        axios.delete(url)
            .then(res => {
                //댓글 삭제후 댓글 목록 다시 출력
                commentListEvent();
            })
    }


    const storage = process.env.REACT_APP_STORAGE; //대표 사진 가져오기
    const navi = useNavigate();
    const [pass, setPass] = useState({});
    const [open, setOpen] = React.useState(false);

    const handleClickOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    const getData = () => {
        let url = "/boot/board/detail?boardnum=" + boardnum;
        axios.get(url)
            .then(res => {
                setSelectData(res.data);
            })
    }
    useEffect(() => {
        getData();
        commentListEvent();//처음 시작시 댓글 출력
    }, []);

    return (
        <div style={{width: '500px', marginLeft: '30px'}}>
            <table className='table table-bordered'>
                <caption align='top'><h3><b>게시글 상세보기</b></h3></caption>
                <tbody>
                <tr>
                    <td>
                        <h3><b>{selectData.subject}</b></h3>
                        <b>{selectData.writer}</b>
                        <span style={{float: 'right', color: 'gray', fontSize: '14px'}}>
                            조회&nbsp;{selectData.readcount}
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
                                    <h3><b>대표 사진</b></h3>
                                    <img alt='' src={`${storage}/${selectData.photo}`}
                                         style={{width: '200px'}}/>
                                </div> : ""
                        }
                        {/*DOM에서 innerHTML을 사용하기 위한 리액트의 대체 방법이다*/}
                        <pre dangerouslySetInnerHTML={{__html: selectData.content}}></pre>
                    </td>
                </tr>
                <tr>
                    <td align='right'>
                        <Button variant='outlined' color='success'
                                size="small" style={{width: '80px'}}
                                onClick={() => navi("/board/list")}><a>목록</a></Button>
                        <Button variant='outlined' color='success'
                                size="small" style={{width: '80px'}}
                                onClick={() => navi("/board/form")}><a>글쓰기</a></Button>
                        <Button variant='outlined' color='success'
                                size="small" style={{width: '80px'}}
                                onClick={() => navi(`/board/updatepass/${boardnum}`)}><a>수정</a></Button>
                        <Button variant='outlined' color='success'
                                size="small" style={{width: '80px'}}
                                onClick={handleClickOpen}><a>삭제</a></Button>

                        <Dialog
                            open={open}
                            onClose={handleClose}
                            PaperProps={{
                                component: 'form',
                                onSubmit: (event) => {
                                    event.preventDefault();
                                    //alert(pass);
                                    let url = `/boot/board/deletecheckpass?boardnum=${boardnum}&pass=${pass}`;
                                    axios.get(url)
                                        .then(res => {
                                            alert(res.data.result);
                                        });
                                    handleClose();
                                },
                            }}
                        >
                            <DialogTitle>삭제 확인</DialogTitle>
                            <DialogContent>
                                <DialogContentText>
                                    비밀번호를 입력해주세요
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
                                <Button type="submit">글삭제</Button>
                            </DialogActions>
                        </Dialog>

                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            {
                                commentList && //이렇게 넣어주면 순간 이미지 불러오며 나는 에러가 안 남
                                commentList.map((item, idx) =>
                                    <tr key={idx}>
                                        {item.nickname} : {item.comment}
                                        <span style={{
                                            fontSize: '13px',
                                            color: 'gray',
                                            marginLeft: '50px'
                                        }}>{item.writeday}</span>
                                        &nbsp;&nbsp;
                                        <EditNote style={{cursor: 'pointer', color: 'gray'}} onClick={() => {
                                            let comment = window.prompt("댓글 수정", item.comment);
                                            let url = `/boot/comment/update?idx=${item.idx}&comment=${comment}`;
                                            axios.get(url)
                                                .then(res => {
                                                    //수정 후 목록 다시 호출
                                                    commentListEvent();
                                                });
                                        }}/>
                                        &nbsp;
                                        <HighlightOff style={{cursor: 'pointer', color: 'gray'}} onClick={() => {
                                            let a = window.confirm("해당 댓글을 삭제하시겠습니까?");
                                            if (a) {
                                                deleteComment(item.idx);
                                            }
                                        }}/>
                                    </tr>)
                            }
                        </div>
                        <hr/>
                        <div className='input-group' style={{width: '500px'}}>
                            {/* 댓글 입력 */}
                            <input type='text' className='form-control'
                                   style={{width: '120px'}} placeholder='닉네임입력'
                                   value={nickname} onChange={(e) => setNickname(e.target.value)}/>
                            &nbsp;&nbsp;
                            <input type='text' className='form-control'
                                   placeholder='댓글을 입력하세요'
                                   value={comment} onChange={(e) => setComment(e.target.value)}
                                   style={{width: '250px'}}/>
                            &nbsp;&nbsp;
                            <Button variant='contained' size="small" color='error'
                                    onClick={addCommentEvent}>저장</Button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    );
};

export default BoardDetail;