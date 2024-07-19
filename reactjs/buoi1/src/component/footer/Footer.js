import React from "react";
import "./footer.css";
export default function Footer(props) {
  let { name1, age1 } = props;
  let arr = [
    { name: "Tuan", age: 22 },
    { name: "Tuan1", age: 22 },
    { name: "Tuan2", age: 22 },
  ];
  return (
    <div>
      Footer
      <h1>tên: {name1}</h1>
      <h1>tuổi: {age1}</h1>
      <ul>
        {arr&&arr.map((item, index) => {
          return (
            <li key={index}>
              {item.name} - {item.age}
            </li>
          );
        })}
      </ul>
    </div>
  );
}
