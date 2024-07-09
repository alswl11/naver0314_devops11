import * as React from 'react';
import {styled} from '@mui/material/styles';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardMedia from '@mui/material/CardMedia';
import CardContent from '@mui/material/CardContent';
import CardActions from '@mui/material/CardActions';
import Collapse from '@mui/material/Collapse';
import Avatar from '@mui/material/Avatar';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import {red} from '@mui/material/colors';
import FavoriteIcon from '@mui/icons-material/Favorite';
import ShareIcon from '@mui/icons-material/Share';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import MoreVertIcon from '@mui/icons-material/MoreVert';
import photo1 from '../image/12.jpg';
import {useState} from "react";

const ExpandMore = styled((props) => {
    const {expand, ...other} = props;
    return <IconButton {...other} />;
})(({theme, expand}) => ({
    transform: !expand ? 'rotate(0deg)' : 'rotate(180deg)',
    marginLeft: 'auto',
    transition: theme.transitions.create('transform', {
        duration: theme.transitions.duration.shortest,
    }),
}));


const FourApp = () => {
    const [expanded, setExpanded] = React.useState(false);
    const [heartcolor, setHeartColor] = useState(false);
    const handleExpandClick = () => {
        setExpanded(!expanded);
    };


    return (
        <Card sx={{maxWidth: 345}}>
            <CardHeader
                avatar={
                    <Avatar sx={{bgcolor: red[500]}} aria-label="recipe">
                        R
                    </Avatar>
                }
                action={
                    <IconButton aria-label="settings">
                        <MoreVertIcon/>
                    </IconButton>
                }
                title="0709 실습 예제"
                subheader="September 14, 2016"
            />
            <CardMedia
                component="img"
                height="194"
                image={photo1}
                alt="Paella dish"
            />
            <CardContent>
                <Typography variant="body2" color="text.secondary">
                    아마 연예인 사진일겁니다.
                </Typography>
            </CardContent>
            <CardActions disableSpacing>
                <IconButton aria-label="add to favorites" style={{color : heartcolor?"red":"gray"}} onClick={()=>setHeartColor(!heartcolor)}>
                    <FavoriteIcon/>
                </IconButton>
                <IconButton aria-label="share">
                    <ShareIcon/>
                </IconButton>
                <ExpandMore
                    expand={expanded}
                    onClick={handleExpandClick}
                    aria-expanded={expanded}
                    aria-label="show more"
                >
                    <ExpandMoreIcon/>
                </ExpandMore>
            </CardActions>
            <Collapse in={expanded} timeout="auto" unmountOnExit>
                <CardContent>
                    <Typography paragraph>Method:</Typography>
                    <Typography paragraph>
                        다른 연예인도 많이 있습니다
                    </Typography>
                    <Typography paragraph>
                       무슨 이야기를 써야할지 잘 모르겠는데요. 일단 길게 적어볼게요.
                    </Typography>
                    <Typography paragraph>
                        참고로 저는 오늘 회를 먹으러 갑니다. 태균오빠가 쏘는 날이라고 하셔서요
                    </Typography>
                    <Typography>
                        솔언니와 태균오빠 5개월만에 보네요. 재밌게 놀다 오겠습니다.
                    </Typography>
                </CardContent>
            </Collapse>
        </Card>
    );
};

export default FourApp;