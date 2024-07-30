import React from "react";
import { Provider } from "react-redux";
import ToDoDisplay from "./component/ToDoDisplay";
import store from "./redux/store";
import Product from "./component/Product";


function App() {
  return (
   
      // <ToDoDisplay />
      <>
        <Product />
      </>
   
  );
}

export default App;
