import React, { useEffect, useState } from "react";

export default function Hook4() {
  const [count, setCount] = useState(10);
  //     const [count2, setCount2] = useState(0);
  //   useEffect(() => {
  //     console.log("useEffect");
  //   }, [count, count2]);
  //   console.log("render");
  useEffect(() => {
    const timer = setInterval(() => {
      setCount((preState) => preState + 1);
      console.log("run");
    });
    return () => {
      clearInterval(timer);
      console.log("clear");
    };
  }, []);

  return (
    <div>
      <h1>UseEffect</h1>
      {/* <h1>{count}</h1>
        <button onClick={() => setCount(count + 1)}>Click</button>
        <h1>{count2}</h1>
        <button onClick={() => setCount2(count2 + 1)}>Click</button> */}
    </div>
  );
}
