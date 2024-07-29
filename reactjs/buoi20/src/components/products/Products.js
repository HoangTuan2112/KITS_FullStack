import React, { useEffect, useState } from 'react'
import axios from 'axios'
import Product from '../product/Product';
import { Container, Row } from 'reactstrap';
import { useContext } from 'react';
import { AppContext } from '../../AppContext';
export default function Products() {
  const [data,setData]=useState([])
useEffect(()=>{
  fetchData();
},[])
const url="https://669f2742b132e2c136fcdd36.mockapi.io/student/student"
const fetchData =()=>{
  axios.get(url)
  .then(function(res){
      setData(res.data)
  })
  .catch(function(error){
    console.log(error)
  })
}
const {cart,setCart,addToCart}=useContext(AppContext)
  return (
    <div>
       
      <Container>
      <Row>
       {
          data.map((item,index)=>(
            <Product key={index} product={item} addToCart={addToCart} />
          ))
       }
        </Row>
        </Container>
    </div>
  )
}
