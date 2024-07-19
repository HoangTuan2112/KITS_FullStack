import React from "react";

export function Hook2() {
  let [count, setCount] = React.useState(0);
  console.log("Hook2");
  return (
    
    <div>
    
      {count}
        <br />
      <button onClick={() => setCount(count + 100)}>Click</button>
    </div>
  );
}
