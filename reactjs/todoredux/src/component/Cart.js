import React from "react";
import { useDispatch, useSelector } from "react-redux";
import { removeFromCart } from "../redux/cartReducer";
import { Container, Table } from "reactstrap";

export default function Cart() {
  const dispatch = useDispatch();
  const { cart } = useSelector((state) => state.cart);

  return (
    <Container>
      <h2> cart</h2>
      {cart.length === 0 && <h1>cart is empty</h1>}
      <Table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Check</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {cart.map((product) => (
            <tr key={product.id}>
              <td >
                <h1>{product.id}</h1>
              </td>
              <td>
                <h1>{product.name}</h1>
              </td>
              <td>
                <h1>{product.check ? "True" : "False"}</h1>
              </td>
              <td>
                <button onClick={() => dispatch(removeFromCart(product))}>
                  Remove
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </Container>
  );
}
