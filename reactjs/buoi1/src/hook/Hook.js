import React from "react";

export function Hook() {
  let [count, setCount] = React.useState(0);
  console.log("Hook1");
  return (
    <div>
      
      {count}
      <br />
      <button onClick={() => setCount(count + 1)}>Click</button>
    </div>
  );
}
