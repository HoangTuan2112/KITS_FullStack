import React, { useEffect, useState } from 'react'
import { useParams } from "react-router-dom";
import axios from 'axios';
export default function ProductDetail() {
    const {id}=useParams()
    const [data,setData]=useState({})
    useEffect(()=>{
      fetchData();
    },[])
    const url="https://669f2742b132e2c136fcdd36.mockapi.io/student/student"
    const fetchData =()=>{
      axios.get(url+"/"+id)
      .then(function(res){
          setData(res.data)
      })
      .catch(function(error){
        console.log(error)
      })
    }
  return (
    <div>
      <h1>Product detail: {id}</h1>
      <p>name: {data.name}</p>
    </div>
  )
}
