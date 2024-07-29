import React from 'react'
import Header from '../../components/header/Header'
import Footer from '../../components/footer/Footer'
import Products from '../../components/products/Products'
import {AppContext} from '../../AppContext'
import {useContext} from 'react'
import './home.css'
export default function Home() {
  const {cart,setCart,addToCart}=useContext(AppContext)
  
 
  return (
    <div>
      <Header />
        <div className='h1'>
            Hiển thị 1 vài sp đại diện
        </div>
        <div>
            <h1>1 vài thành phần khác, không cần thiết tách components</h1>
        </div>
        {
          
         

        }
      <Footer />
    </div>
  )
}
