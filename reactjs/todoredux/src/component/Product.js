import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import {
  fetchProductRequest,
  filterProduct,
  removeFromProduct,
  toggleCheck,
  updateProduct,
} from "../redux/productReducer";

import "./product.css";
import { Button, Container, Input, Table } from "reactstrap";

export default function Product() {
  const dispatch = useDispatch();
  const [name, setName] = React.useState("");
  const [idName, setIdName] = React.useState(null);
  const [isEdit, setIsEdit] = React.useState(false);
  const { products, status, error } = useSelector((state) => state.products);
  useEffect(() => {
    dispatch(fetchProductRequest());
  }, []);
  if (status === "loading") {
    return <h1>Loading...</h1>;
  }
  if (status === "failed") {
    return <h1>{error}</h1>;
  }
  return (
    <Container>
      <Table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            {/* <th>Check</th> */}
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {products.map((product) => (
            <tr key={product.id}>
              <td>
                <h1>{product.id}</h1>
              </td>
              <td
                className={
                  product.check ? "product-name active" : "product-name "
                }
              >
                {isEdit==true&&idName===product.id ? 
                  (
                  <Input
                    type="text"
                    value={name}
                    placeholder={product.name}
                    onChange={(e) =>
                      setName(e.target.value)
                      
                    }
                    onKeyDown={(e) => {
                      if (e.key === "Enter") {
                        dispatch(
                          updateProduct({
                            ...product,
                            name: name,
                          })
                        );
                        setIsEdit(false);
                      }
                    }}
                  />
                ) :

                (
                  <h1
                    onClick={() => {
                      dispatch(toggleCheck(product));
                    }}
                    onDoubleClick={() => {setIdName(product.id); setIsEdit(true)}}
                  >
                    {product.name}
                  </h1>
                ) }
              </td>
              {/* <td>
                <h1>{product.check ? "True" : "False"}</h1>
              </td> */}
              <td>
                <button onClick={() => dispatch(removeFromProduct(product))}>
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
