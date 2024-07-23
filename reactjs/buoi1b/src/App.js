import React from 'react'
import Hook1 from './hook/Hook1'
import Hook2 from './hook/Hook2'
import Hook3 from './hook/Hook3'

import 'bootstrap/dist/css/bootstrap.min.css';
import Students from './component2/Students';
import './style.css'

export default function App() {
  return (
    <div>
    {/* <Hook2/> */}
    {/* <Hook3/>
     */}
      <Students/>
    </div>
  )
}
