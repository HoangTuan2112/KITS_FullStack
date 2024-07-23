import React, { useState } from "react";
import { Button, Input, ListGroupItem } from "reactstrap";

export default function Student(props) {
  const { student, delStudent, toggleChecked, update } = props;
  const [isEdit, setIsEdit] = useState(false);
  const [name, setName] = useState(student.name);
  return (
    <ListGroupItem className="student-item">
      <Input
        type="checkbox"
        checked={student.checked}
        onChange={() => toggleChecked(student.id)}
      />
      <div onDoubleClick={() => setIsEdit(true)}>
        {isEdit ? (
          <Input
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            onKeyDown={(e) => {
              if (e.key === "Enter") {
                setIsEdit(false);
                update(student.id, name);
              }
            }}
          />
        ) : (
          <span
            onClick={() => toggleChecked(student.id)}
            className={student.checked ? "student active" : "student"}
          >
            {student.name}{" "}
          </span>
        )}
      </div>
      <Button color="danger" onClick={() => delStudent(student.id)}>
        X
      </Button>
    </ListGroupItem>
  );
}
