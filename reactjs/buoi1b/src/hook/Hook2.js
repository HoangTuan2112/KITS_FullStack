import React, { useRef } from "react";
import "./hook.css";
export default function Hook2() {
  let [flag, setFlag] = React.useState(false);
  let sidebarRef= useRef();
  return (
    <>
      <div className={flag ? "hook2 active" : "hook2"}>
        <p>{flag ? "True" : "False"}</p>
        <button onClick={() => setFlag(!flag)}>Toggle</button>
      </div>
      <div className="meo" >

      </div>
    </>
  );
}
