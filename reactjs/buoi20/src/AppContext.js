import React from "react";
import { createContext, useState,useEffect } from "react";
import Swal from "sweetalert2";
export const AppContext = createContext({});
export default function AppProvider({ children }) {
  const [cart, setCart] = useState([]);
 
    useEffect(() => {
        if(localStorage.getItem('cart')){
            setCart(JSON.parse(localStorage.getItem('cart')))
          }
          else{
            setCart([])
          }
    
     
    }, [])
    
  const addToCart = (product) => {
    //   setCart([...cart,product])
    // mergeProducts([...cart, product]);
    mergeProducts([...cart, product]);
    setCart(mergeProducts([...cart, product]));
    localStorage.setItem('cart',JSON.stringify(mergeProducts([...cart, product])))
        
    console.log(cart);
 
    Swal.fire({
      title: "Good job!",
      text: "You clicked the button!",
      icon: "success",
    });
    return true
  };
  function mergeProducts(products) {
    const mergedProducts = {};
  
    products.forEach(product => {
      if (mergedProducts[product.id]) {
        mergedProducts[product.id].quantity += product.quantity;
      } else {
        mergedProducts[product.id] = { ...product };
      }
    });
   
    return Object.values(mergedProducts);
  }
  function sumQuantity(products) {
    return products.reduce((sum, product) => sum + product.quantity, 0);
  }
  return (
    <AppContext.Provider value={{ cart, setCart, addToCart ,mergeProducts,sumQuantity}}>
      {children}
    </AppContext.Provider>
  );
}
