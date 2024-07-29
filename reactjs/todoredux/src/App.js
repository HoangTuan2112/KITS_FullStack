import React from "react";
import { Provider } from "react-redux";
import ToDoDisplay from "./component/ToDoDisplay";
import store from "./redux/store";


function App() {
  return (
   
      <ToDoDisplay />
   
  );
}

export default App;
