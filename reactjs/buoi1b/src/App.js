import React, { useState } from "react";
import Hook1 from "./hook/Hook1";
import Hook2 from "./hook/Hook2";
import Hook3 from "./hook/Hook3";

import "bootstrap/dist/css/bootstrap.min.css";
import Students from "./component2/Students";
import "./style.css";
import Hook4 from "./hook/Hook4";
import Api from "./hook/Api";

export default function App() {
  const [show, setShow] = useState(true);
  return (
    <div>
      {/* <Hook2/> */}
      {/* <Hook3/>
       */}
      {/* <Students/> */}
      {/* {show ? <Hook4 /> : "asdasdasd"}
      <button onClick={() => setShow(!show)}>Show</button> */}
      <Api />
    </div>
  );
}
