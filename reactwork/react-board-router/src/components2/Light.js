import { Button } from '@mui/material';
import React from 'react';

const Light = ({room,on,toggle}) => {
    console.log({room,on});
    return (
        <div>
            <Button onClick={toggle}
                    variant='contained' color="error">
                {room}
                {on ? "💡" : "⬛"}
            </Button>
        </div>
    );
};

//export default Light;
export default React.memo(Light);