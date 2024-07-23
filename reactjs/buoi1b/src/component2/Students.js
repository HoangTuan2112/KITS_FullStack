import React, { useEffect, useState } from "react";
import Add from "./Add";
import Student from "./Student";
import Footer from "./Footer";
import { Container, ListGroup } from "reactstrap";
import { Button, Input } from "reactstrap";
export default function Students() {
  const [list, setList] = useState([
    { id: 1, name: "Huyen", checked: true },
    { id: 2, name: "Hoa", checked: true },
    { id: 3, name: "Hung", checked: true },
    { id: 4, name: "Long", checked: true },
    { id: 5, name: "Dung", checked: true },
    { id: 6, name: "Linh", checked: true },
    { id: 7, name: "Ngoc", checked: true },
  ]);
   

  useEffect(() => {
    if(window.localStorage.getItem("list") !== null){
      setList(JSON.parse(window.localStorage.getItem("list")));
     }
  }, []);



 
  const a= list.map((student) => student.checked).every((checked) => checked);
  const [flag, setFlag] = useState("");
  const [checkAll, setCheckAll] = useState(a? true : false);
  const update = (id,name)=>{
    const newList = list.map((student) =>
      student.id === id ? { ...student, name: name } : student
    );
    setList(newList);
    window.localStorage.setItem("list", JSON.stringify(newList));
  }

  const delStudent = (id) => {
    const newList = list.filter((student) => student.id !== id);
    setList(newList);
    // setList2(newList);
    // const newList2 = list2.filter((student) => student.id !== id);
    // setList2(newList2);
    window.localStorage.setItem("list", JSON.stringify(newList));
  };
  const toggleChecked = (id) => {
    const newList = list.map((student) =>
      student.id === id ? { ...student, checked: !student.checked } : student
    );
    setList(newList);
    window.localStorage.setItem("list", JSON.stringify(newList));
    // const newList2 = list2.map((student) => {
    //   const found = newList.find((newStudent) => newStudent.id === student.id);
    //   return found ? { ...student, checked: found.checked } : student;
    // });
    // setList2(newList2);
  };

  const idMax = (list) => {
    let max = 0;
    list.forEach((student) => {
      if (student.id > max) {
        max = student.id;
      }
    });
    return max;
  };

  const addStudent = (name) => {
  
    const newList = [
      ...list,
      { id: list.length==0?1:idMax(list) + 1, name: name, checked: false },
    ];
    setList(newList);
    window.localStorage.setItem("list", JSON.stringify(newList));
    // setList2(newList);
    console.log(list)
  };
  const filterList = (list, flag) => {
    if (flag === "Uncomplete") {
      return list.filter((student) => !student.checked);
    } else if (flag === "Completed") {
      return list.filter((student) => student.checked);
    } else if (flag === "Delete all") {
      // return list.filter((student) => !student.checked);

      setList(list.filter((student) => !student.checked));
      window.localStorage.setItem("list", JSON.stringify(list.filter((student) => !student.checked)));
      setCheckAll(false);
      setFlag("");
    } else if (flag === "checkAll") {
      if (checkAll) {
        setList(list.map((student) => ({ ...student, checked: false })));
        window.localStorage.setItem("list", JSON.stringify(list.map((student) => ({ ...student, checked: false }))));  
        setCheckAll(false);
        setFlag("");
      } else {
        setList(list.map((student) => ({ ...student, checked: true })));
        window.localStorage.setItem("list", JSON.stringify(list.map((student) => ({ ...student, checked: true }))));
        setCheckAll(true);
        setFlag("");
      }
    }

    return list;
  };
  const renderList = (list, flag) => {
    return filterList(list, flag).map((student, index) => (
      <Student
        key={index}
        student={student}
        delStudent={delStudent}
        toggleChecked={toggleChecked}
      />
    ));
  };
  // const filter = (status) => {
  //   const newList = list.filter((student) => student.checked === status);
  //   setList(list2);
  // };

  // const filter1 = () => {
  //   const newList1 = list2.filter((student) => student.checked === false);
  //   setList(newList1);
  // };
  // const filter2 = () => {
  //   const newList2 = list2.filter((student) => student.checked === true);
  //   setList(newList2);
  // };

  // const deleteAll = async () => {
  //   // Assuming delStudent returns a promise
  //   const deletePromises = list.filter(student => student.checked)
  //                                .map(student => delStudent(student.id));

  //   await Promise.all(deletePromises);

  //   // Call the render function here after all deletions are complete
  //   // setList(list);
  //   console.log("hahaha")
  // };
  // const deleteAll = async () => {
  //   // Assuming delStudent returns a promise
  //   const deletePromises = list.map((student) => {
  //         if (student.checked === true) {
  //           delStudent(student.id);
  //         }
  //       });

  //   await Promise.all(deletePromises);

  //   // Update the state to exclude deleted items
  //   const remainingItems = list.filter(student => !student.checked);
  //   setList(remainingItems);
  //   setList2(remainingItems);

  //   console.log("Deletion complete");
  // };

  return (
    <div>
      <Container className="w-50 p-5 my-5">
        <Add addStudent={addStudent} idMax={idMax} />

        <ListGroup>
          {   
     
            filterList(list, flag).map((student, index) => (
            <Student
              key={index}
              student={student}
              delStudent={delStudent}
              toggleChecked={toggleChecked}
              update={update}
            />
          ))}
          {/* {renderList()} */}
        </ListGroup>
        {/* <Footer /> */}
        <div className="filter">
          <Input
            type="checkbox"
            checked={checkAll}
            onClick={() => setFlag("checkAll")}
          />
          <Button color="primary" onClick={() => setFlag("")}>
            All
          </Button>
          <Button color="primary" onClick={() => setFlag("Uncomplete")}>
            Uncomplete
          </Button>
          <Button color="primary" onClick={() => setFlag("Completed")}>
            Completed
          </Button>
          <Button color="primary" onClick={() => setFlag("Delete all")}>
            Delete all
          </Button>
        </div>
      </Container>
    </div>
  );
}
