import React from "react";
import { useContext } from "react";
import { AppContext } from "../../AppContext";
import { Button, Table } from "reactstrap";
import "./cart.css";
import Header from "../header/Header";

export default function Cart() {
  const { cart, setCart, mergeProducts, sumQuantity } = useContext(AppContext);
  console.log(cart);
  //   setCart(mergeProducts(cart));
  return (
    <div>
      <Header />

      <Table>
        <thead>
          <tr>
            <th>ID</th>
            <th> Name</th>
            <th>Quantity</th>
            <th>price</th>
            <th>Action</th>
          </tr>
        </thead>
        {cart.map((item, index) => (
          <tbody>
            <tr>
              <td>{item.id}</td>
              <td>{item.name}</td>
              <td>{item.quantity}</td>
              <td>{item.quantity * 1000}</td>
              <td className="action">
                <Button
                  className="btn"
                  onClick={() => {
                    const newCart = cart.map((product) => {
                      if (product.id === item.id && product.quantity > 0) {
                        return { ...product, quantity: product.quantity - 1 };
                      }
                      return product;
                    });

                    setCart(newCart);
                    localStorage.setItem("cart", JSON.stringify(newCart));
                  }}
                  color="warning"
                >
                  Decrease
                </Button>
                <Button
                  onClick={() => {
                    const newCart = cart.map((product) => {
                      if (product.id === item.id && product.quantity < 20) {
                        return { ...product, quantity: product.quantity + 1 };
                      }
                      return product;
                    });

                    setCart(newCart);
                    localStorage.setItem("cart", JSON.stringify(newCart));
                  }}
                  color="warning"
                >
                  Increse
                </Button>
                <Button
                  onClick={() => {
                    const newCart = cart.filter(
                      (product) => product.id !== item.id
                    );
                    setCart(newCart);
                    localStorage.setItem("cart", JSON.stringify(newCart));
                  }}
                  color="danger"
                >
                  Delete
                </Button>
              </td>
            </tr>
          </tbody>
        ))}
      </Table>
      <h1>Total price :{sumQuantity(cart) * 1000} vnd</h1>
    </div>
  );
}
