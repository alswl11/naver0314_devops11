import { CameraAltRounded } from '@mui/icons-material';
import { Alert, Button } from '@mui/material';
import { Editor, Viewer } from '@toast-ui/react-editor';
import '@toast-ui/editor/dist/toastui-editor.css';
import axios from 'axios';
import React, { useEffect, useRef, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import 'tui-color-picker/dist/tui-color-picker.css';
import '@toast-ui/editor-plugin-color-syntax/dist/toastui-editor-plugin-color-syntax.css';
import colorPlugin from '@toast-ui/editor-plugin-color-syntax';

const UpdateForm = () => {
    const [writer,setWriter]=useState('');
    const [subject,setSubject]=useState('');
    const [photo,setPhoto]=useState('no');
    const [content,setContent]=useState('');
    const {boardnum}=useParams();

    console.log("boardnum="+boardnum);

    const navi=useNavigate();

    const fileRef=useRef(null);
    const contentRef=useRef('');

    const getData=()=>{
        let url="/boot/board/updateform?boardnum="+boardnum;
        axios.get(url)
            .then(res=>{
                setWriter(res.data.writer);
                setSubject(res.data.subject);
                setContent(res.data.content);
            })
    }

    //1. 먼저 호출후
    useEffect(()=>{
        getData();
    },[]);

    //2. content 값 가져온후 호출
    useEffect(()=>{
        contentRef.current?.getInstance().setHTML(content);
    },[content]);//content 값 변경시 호출



    //.env 의 변수를 가져오는 방법
    const storage=process.env.REACT_APP_STORAGE;
    console.log(storage);

    //파일 업로드 이벤트
    const uploadPhoto=(e)=>{
        const uploadFile=e.target.files[0];
        const uploadForm=new FormData();
        uploadForm.append("upload",uploadFile);

        axios({
            method:'post',
            url:'/boot/board/upload',
            data:uploadForm,
            headers:{'Content-Type':'multipart/form-data'},
        }).then(res=>{
            //스토리지에 저장된 파일명을 photo 에 넣기
            setPhoto(res.data);
        })
    }


    //수정 버튼 이벤트
    let content2;
    const dataUpdateEvent=()=>{
        content2=contentRef.current?.getInstance().getHTML();

        axios.post("/boot/board/update",{boardnum,writer,photo,subject,content:content2})
            .then(res=>{
                //상세보기로 이동
                navi(`/board/detail/${boardnum}`)
            })
    }
    return (
        <div>
            <Alert>게시판 글수정</Alert>
            <table className='table table-bordered'
                   style={{width:'400px'}}>
                <tbody>
                <tr>
                    <th className='table-info'
                        style={{width:'100px'}}>작성자</th>
                    <td>
                        <input type='text'  className='form-control'
                               value={writer} onChange={(e)=>setWriter(e.target.value)}/>
                    </td>
                </tr>

                <tr>
                    <td colSpan={2}>
                        <input type='text' className='form-control'
                               placeholder='제목을 입력해주세요'
                               value={subject} onChange={(e)=>setSubject(e.target.value)}/>
                    </td>
                </tr>
                <tr>
                    <td colSpan={2}>
                        <input type='file' style={{display:'none'}}
                               ref={fileRef} onChange={uploadPhoto}/>
                        <b>대표 이미지 변경하기 </b>
                        <CameraAltRounded onClick={()=>fileRef.current.click()}
                                          style={{cursor:'pointer',fontSize:'30px'}}/>

                        {/* 스토리지에 저장된 이미지를 보여준다 */}
                        <img alt='' src={`${storage}/${photo}`}
                             style={{width:'60px',marginLeft:'30px'}}/>

                        <br/>

                        <Editor
                            //placeholder="내용을 입력해주세요."
                            previewStyle="vertical" // 미리보기 스타일 지정
                            height="500px" // 에디터 창 높이
                            initialEditType="wysiwyg" // 초기 입력모드 설정(디폴트 markdown)
                            plugins={[colorPlugin]}
                            toolbarItems={[
                                // 툴바 옵션 설정
                                ['heading', 'bold', 'italic', 'strike'],
                                ['hr', 'quote'],
                                ['ul', 'ol', 'task', 'indent', 'outdent'],
                                //['table', 'image', 'link'],
                                ['image'],
                                ['code', 'codeblock']
                            ]}

                            hooks={{
                                addImageBlobHook: async (blob, callback) => {
                                    console.log(blob);
                                    const formData = new FormData()
                                    formData.append('upload', blob)

                                    let url = "/boot/board/upload" //백엔드에서 스토리지에 사진 저장하기

                                    axios.post(url, formData, {
                                        header: {"content-type": "multipart/formdata"}
                                    }).then(res => {
                                        callback(storage+"/"+res.data)//스토리지 파일명을 img태그에 넣어준
                                    })

                                    //callback(blob.name);//사진명만 일단 확인-사진 안나옴
                                }
                            }}
                            ref={contentRef}
                        ></Editor>
                        <Viewer initialValue={content} />
                    </td>
                </tr>
                <tr>
                    <td colSpan={2} align='center'>
                        <Button variant='contained' color='success'
                                style={{width:'100px'}}
                                onClick={dataUpdateEvent}>DB수정</Button>
                        &nbsp;&nbsp;
                        <Button variant='contained' color='success'
                                style={{width:'100px'}}
                                onClick={()=>navi(`/board/detail/${boardnum}`)}>수정취소</Button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    );
};

export default UpdateForm;