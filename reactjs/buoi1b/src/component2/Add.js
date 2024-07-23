import React, { useState } from "react";
import { Button, Input } from "reactstrap";

export default function Add(props) {
  const [name, setName] = useState("");
  const { addStudent, idMax } = props;
  return (
   
      <div className="add">
        <Input
          placeholder="Add new student"
          value={name}
          onChange={(e) => setName(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === "Enter") {
              addStudent(name);
              setName("");
            }
          
          }}
        />
        <Button color="success" onClick={()=>{
          addStudent(name);
          setName("");
        }}>
          Add
        </Button>
      </div>
   
  );
}
