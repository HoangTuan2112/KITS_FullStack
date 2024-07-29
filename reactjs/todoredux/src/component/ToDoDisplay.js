import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { addToDo, checkToDo, deleteToDo } from "../redux/todoReducer";

export default function ToDoDisplay() {
  const list = useSelector((state) => state.todoReducer.students);
  const dispatch = useDispatch();
  const [text, setText] = React.useState("");
  const [edit, setEdit] = React.useState(true);
  const inputRef = React.useRef(null);
  console.log(list);

  return (
    <div>
      <input
        type="text"
        value={text}
        onChange={(e) => setText(e.target.value)}
        onKeyDown={(e) => {
          if (e.key === "Enter") {
            dispatch(addToDo(text));
            setText("");
          }
        }}
      />
      {list.map((todo) => (
        <div key={todo.id}>
          <input type="checkbox" checked={todo.check}   />

        <input ref={inputRef} placeholder={todo.job} readOnly onClick={()=>dispatch(checkToDo(todo.id))} onDoubleClick={()=>{inputRef.current}}></input>
          <button onClick={() => dispatch(deleteToDo(todo.id))}>delete</button>
        </div>
      ))}
    </div>
  );
}
