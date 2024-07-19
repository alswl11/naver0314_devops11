import React, {useState} from 'react';
import {Alert, Button} from "@mui/material";
import DaumPostcode from 'react-daum-postcode';
import Dialog from "@mui/material/Dialog";
import DialogTitle from "@mui/material/DialogTitle";
import DialogContent from "@mui/material/DialogContent";
import DialogContentText from "@mui/material/DialogContentText";
import DialogActions from "@mui/material/DialogActions";
const DaumPostApp = () => {

    const [openPostcode, setOpenPostcode] = useState(false);
    const [address, setAddress] = useState('');

    const [openPostcode2, setOpenPostcode2] = useState(false);
    const [address2, setAddress2] = useState('');
    const [open, setOpen] = React.useState(false);

    const addrhandle = {
        // events
        clickButton: () => {
            setOpenPostcode(current => !current);
        },
        // 주소 선택 event
        selectAddress: (data) => {
            console.dir(data);
            setAddress(`주소 : ${data.address} ${data.buildingName} [${data.zonecode}] `);
            setOpenPostcode(false);
        }

    }
    const handleClose = () => {
        setOpen(false);
    };

    const addrhandle2 = {
        // events
        clickButton: () => {
            setOpenPostcode2(current => !current);
            setOpen(true);
        },
        // 주소 선택 event
        selectAddress2: (data) => {
            console.dir(data);
            setAddress2(`주소 : ${data.address} ${data.buildingName} [${data.zonecode}] `);
            setOpenPostcode2(false);
            // 다이얼로그 닫기
            setOpen(false);
        }

    }
    return (
        <div>
            <Alert>카카오 주소 나타내기</Alert>
            <h4>카카오 주소 나타내기 #1</h4>
            <Button variant="contained" color="success" size="small" onClick={addrhandle.clickButton}>주소검색 #1</Button>
            <h3>{address}</h3>
            {
                openPostcode &&
                <DaumPostcode onComplete={addrhandle.selectAddress} autoClose={false} defaultQuery='강남대로 94길 20'/>
            }

            <hr/>

            <h4>카카오 주소 나타내기 #2</h4>
            <Button variant="contained" color="success" size="small" onClick={addrhandle2.clickButton}>주소검색 #2</Button>
            <h3>{address2}</h3>
            <Dialog
                open={open}
                onClose={handleClose}
                aria-labelledby="alert-dialog-title"
                aria-describedby="alert-dialog-description"
            >
                <DialogTitle id="alert-dialog-title">
                   카카오 주소 검색
                </DialogTitle>
                <DialogContent>
                    {/*<DialogContentText id="alert-dialog-description">*/}
                    {/*    주소를 검색하세요*/}
                    {/*</DialogContentText>*/}
                    <DaumPostcode onComplete={addrhandle2.selectAddress2} autoClose={false} defaultQuery='반포자이'/>
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleClose} autoFocus>
                        닫기
                    </Button>
                </DialogActions>
            </Dialog>
        </div>
    );
};

export default DaumPostApp;