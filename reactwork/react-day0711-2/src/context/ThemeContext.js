/*
**Context API 는 리액트 프로젝트에서 전반적으로 사용할 데이타가 있을때 유용한 기능이다**
이를테면 로그인정보,테마등등 여러종류가 있을것이다
Provider 를 사용하면 Context의 value 를 변경할수 있다
props 로 일일이 전달하지 않아도 state 데이타에 접근이 가능하다
Context 를 사용하면 컴포넌트를 재사용하기 어려워질수 있기때문에 꼭 필요한 경우에만 사용하자

           Root
            | 값전달 : props
           Page
    |       |         |  값전달 : props
  Header  Content  Footer

  : 이경우에 Root 의 값을 Header 에서 사용하려면 무조건 Page 에 props 로 전달후
   Page 에서 다시 Header 로 props 로 전달을 해야만 한다,
   만약 Page 에서는 해당 변수가 필요없을수도 있는데 쓸데없이 props 변수를 받게 된다
   이런경우 이런 불편을 해소하기 위해서 useContext 를 이용해서 값전달을 할수가 있다

*/

import { createContext } from "react";


export const ThemeContext=createContext(null);