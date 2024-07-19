import React, { useState } from 'react'

export default function Hook1() {
    let [name, setName] =useState('');
    let [a, setA] = useState('');
    let [b, setB] = useState('');
    let [result, setResult] = useState('');
    let [textA, setTextA] = useState('');   
    let [textB, setTextB] = useState('');
  return (
    <div>
        <p>{name} {a} {b}</p>
        <input type="text" placeholder='nhap ten di' onChange={(e)=>setName(e.target.value)}/><br/>

        <input type="text" placeholder='' value={result} readOnly/><br/>
        <input type="text" placeholder='nhap a' value={a}  onChange={(e)=>setA(e.target.value) } /><br/>
        <input type="text" placeholder='nhap a' onChange={(e)=>setB(e.target.value)} /><br/>
        <button onClick={()=>setResult((parseFloat(a)+parseFloat(b)).toFixed(2))}>+</button>
        <button onClick={()=>setResult((parseFloat(a)-parseFloat(b)).toFixed(2))}>-</button>
        <button onClick={()=>setResult((parseFloat(a)*parseFloat(b)).toFixed(2))}>*</button>
        {/* <button onClick={()=>setResult((parseFloat(a)/parseFloat(b)).toFixed(2))}>/</button> */}
        <button onClick={()=>setResult((parseFloat(a)/parseFloat(b)).toFixed(2))}>/</button>
        <button onClick={()=>{
        setResult("");
         setA=('');
        //  setB=("");
        //     setTextA=("");
        //     setTextB=("");
         }}>clear</button>

        
    </div>
  )
}
