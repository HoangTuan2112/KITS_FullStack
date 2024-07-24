import React, { useEffect, useState } from "react";
import axios from "axios";
import "./api.css";
export default function Api() {
  const [data, setData] = useState([]);
  const [name, setName] = useState("");
  const [isEdit, setIsEdit] = useState(false);
  const [id, setId] = useState("");
  const [text, setText] = useState(name);
  const [text2, setText2] = useState("");

  const fectApi = () => {
    axios
      .get("https://669f2742b132e2c136fcdd36.mockapi.io/student/student")
      .then((res) => {
        setData(res.data);
        console.log("fectApi");
      })
      .catch((err) => console.log(err));
  };
  useEffect(() => {
    fectApi();
  }, []);
  const renderData = () => {
    return data.map((item, index) => (
      <div key={index} className="data">
        <h1>{item.id} </h1>
        {isEdit && id === item.id ? (
          <input
            id={id}
            key={index}
            value={text}
            onChange={(e) => setText(e.target.value)}
            onKeyDown={(e) =>
              e.key === "Enter" ? updateStudent(item.id, text) : renderData()
            }
          ></input>
        ) : (
          <h1
            key={index}
            onClick={() => {
              setIsEdit(true);
              setId(item.id);
              setText(item.name);
            }}
          >
            {item.name}
          </h1>
        )}
        {/* <h1>{item.name}</h1> */}

        <button
          onClick={() => {
            deleteStudent(item.id);
          }}
        >
          x
        </button>
      </div>
    ));
  };
  useEffect(() => {
    renderData();
  }, [data]);
  const addStudent = (name) => {
    axios
      .post("https://669f2742b132e2c136fcdd36.mockapi.io/student/student", {
        name: name,
      })
      .then((res) => {
        setData([...data, res.data]);
      })
      .catch((err) => console.log(err));
    setName("");
  };
  const deleteStudent = (id) => {
    axios
      .delete(
        `https://669f2742b132e2c136fcdd36.mockapi.io/student/student/${id}`
      )
      .then(() => {
        setData(data.filter((item) => item.id !== id));
      })
      .catch((err) => console.log(err));
  };
  const updateStudent = (id, name) => {
    axios
      .put(
        `https://669f2742b132e2c136fcdd36.mockapi.io/student/student/${id}`,
        {
          name: name,
        }
      )
      .then(() => {
        setData(
          data.map((item) => (item.id === id ? { ...item, name: name } : item))
        );
        setIsEdit(false);
      })
      .catch((err) => console.log(err));
  };
  const filterList = (name) => {
    const newData = data.filter((item) => item.name.includes(name));
    setData(newData);
    setText2("");
  };

  return (
    <div>
      <input
        type="text"
        placeholder="nhap ten"
        value={name}
        onChange={(e) => setName(e.target.value)}
        onKeyDown={(e) => {
          e.key === "Enter" ? addStudent(name) : renderData();
        }}
      />
      <br></br>
      <input
        type="text"
        placeholder="loc theo ten"
        value={text2}
        onChange={(e) => setText2(e.target.value)}
        onKeyDown={(e) =>
          e.key === "Enter" ? filterList(text2) : renderData()
        }
      ></input>
      <br></br>
      <button
        onClick={() => {
          fectApi();
          renderData();
        }}
      >
        All
      </button>
      {renderData()}
    </div>
  );
}
