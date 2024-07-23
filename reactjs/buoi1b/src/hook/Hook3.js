import React, {  useState } from 'react'

export default function Hook3() {
    const [student, setStudent] = useState({name:'',age:0})
    // const name = useRef()
    // const age = useRef()
  return (
    <div>
    <h1>Em là {student.name} Năm nay em {student.age} tuổi </h1>
    <input type="text" onChange={(e)=>setStudent({...student,name:e.target.value})} />
    <br/>
    <input type="number" onChange={(e)=>setStudent({...student,age:e.target.value})} />
    {/* <form>
    <input type="text" ref={name}  />
    <br/>
    <input type="number" ref={age} />
    <input type="submit" value="Submit" onClick={()=>{
        setStudent({name:name.current.value,age:age.current.value})
    
    }}/>
    </form> */}
    </div>
  )
}
