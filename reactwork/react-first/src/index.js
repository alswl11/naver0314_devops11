import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
// import App from './App';
import reportWebVitals from './reportWebVitals';
import Main from "./components/Main";
// default로 export 한 경우 import 시에 이름을 마음대로 정할 수 있음
// import OneApp from "./components/OneApp";
// export{OneApp} 으로 했을 경우 잁케 정확하게 나옴
// import {OneApp} from "./components/OneApp";


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    {/*<App />*/}
    {/*  <OneApp/>*/}
    {/*  <OneApp/>*/}
      <Main/>
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
